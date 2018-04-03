unit DockIntf;

interface

type
  TForms = (fmNone, fmEmployeeDrawer,fmPaf,fmPendingPaf);

  IDock = Interface(IInterface)
    ['{4D2068E2-715C-42F1-BA30-AC450E95F023}']
    procedure DockForm(const fm: TForms; AObject: TObject);
  End;

implementation

end.
