unit PafListPending;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked2, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids, RzDBGrid;

type
  TfrmPafListPending = class(TfrmBaseDocked2)
    grSearch: TRzDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  AppData, FormsUtil;

procedure TfrmPafListPending.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(self);
end;

end.
