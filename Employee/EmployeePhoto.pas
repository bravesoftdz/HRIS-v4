unit EmployeePhoto;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DXSUtil, DSPack, BaseForm, Vcl.ExtCtrls,
  Vcl.StdCtrls, DirectShow9, RzLabel, Employee;

type
  TfrmEmployeePhoto = class(TfrmBase)
    CaptureGraph: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    VideoSourceFilter: TFilter;
    VideoWindow: TVideoWindow;
    EmployeePhoto: TImage;
    ListBox: TListBox;
    ListBox2: TListBox;
    urlMain: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure urlMainClick(Sender: TObject);
  private
    { Private declarations }
    FEmployee: TEmployee;
    VideoDevice: TSysDevEnum;
    VideoMediaTypes: TEnumMediaType;

    procedure SetImageDevice;
    procedure StartCapture;
    procedure GetSnapshot;
    procedure LoadPhoto;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AEmployee: TEmployee); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  HRISGlobal;

constructor TfrmEmployeePhoto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TfrmEmployeePhoto.Create(AOwner: TComponent;
  const AEmployee: TEmployee);
begin
  inherited Create(AOwner);
  FEmployee := AEmployee;
end;

procedure TfrmEmployeePhoto.FormCreate(Sender: TObject);
var
  i: integer;
begin
   VideoDevice := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
   for i := 0 to VideoDevice.CountFilters - 1 do
     ListBox.Items.Add(VideoDevice.Filters[i].FriendlyName);

   VideoMediaTypes := TEnumMediaType.Create;

   LoadPhoto;
end;

procedure TfrmEmployeePhoto.GetSnapshot;
var
  path: string;
  filename: string;
begin
  path := '';

  SampleGrabber.GetBitmap(EmployeePhoto.Picture.Bitmap);

  path := HRIS.AppImagesPath;

  filename := FEmployee.IdNumber + '.jpg';

  // save file
  if not DirectoryExists(path) then CreateDir(path);

  EmployeePhoto.Picture.SaveToFile(path + filename);

  VideoWindow.Visible := false;
end;

procedure TfrmEmployeePhoto.LoadPhoto;
var
  imageFile: string;
begin
  imageFile := HRIS.AppImagesPath + FEmployee.IdNumber + '.jpg';
  if FileExists(imageFile) then EmployeePhoto.Picture.LoadFromFile(imageFile);
end;

procedure TfrmEmployeePhoto.SetImageDevice;
var
 PinList: TPinList;
 i: integer;
begin
  if ListBox.Items.Count = 0 then
  begin
    // lblStatus.Caption := 'No imaging device found.';
    Exit;
  end;

  VideoDevice.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if ListBox.ItemIndex <> -1 then
  begin
    // Set the device which we work with
    VideoSourceFilter.BaseFilter.Moniker := VideoDevice.GetMoniker(ListBox.ItemIndex);
    VideoSourceFilter.FilterGraph := CaptureGraph;
    CaptureGraph.Active := true;
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    ListBox2.Clear;
    VideoMediaTypes.Assign(PinList.First);

    // Adding permission to ListBox2, which supports device
    for i := 0 to VideoMediaTypes.Count - 1 do
      ListBox2.Items.Add(VideoMediaTypes.MediaDescription[i]);

    CaptureGraph.Active := false;
    PinList.Free;

    ListBox2.ItemIndex := 0;

    StartCapture;
  end;
end;

procedure TfrmEmployeePhoto.StartCapture;
var
 PinList: TPinList;
begin
  // Activating graph filter, at this stage the source filter is added to the graph
  CaptureGraph.Active := true;

  // The configuration of the output device
  if VideoSourceFilter.FilterGraph <> nil then
  begin
    PinList := TPinList.Create(VideoSourceFilter as IBaseFilter);
    if ListBox2.ItemIndex <> -1 then
    with (PinList.First as IAMStreamConfig) do
      SetFormat(VideoMediaTypes.Items[ListBox2.ItemIndex].AMMediaType^);
    PinList.Free;
  end;

  // now render streams
  with CaptureGraph as IcaptureGraphBuilder2 do
  begin
    // Hooking up a preview video (VideoWindow)
    if VideoSourceFilter.BaseFilter.DataLength > 0 then
      RenderStream(@PIN_CATEGORY_PREVIEW, nil, VideoSourceFilter as IBaseFilter,
        SampleGrabber as IBaseFilter , VideoWindow as IBaseFilter);
   end;

 //Launch video
 CaptureGraph.Play;
end;

procedure TfrmEmployeePhoto.urlMainClick(Sender: TObject);
begin
  if VideoWindow.Visible then GetSnapshot
  else
  begin
    ListBox.ItemIndex := 0;
    SetImageDevice;
    VideoWindow.Visible := true;
  end;
end;

end.
