unit uOMScxBarEditItem;

interface

uses cxBarEditItem, Classes;

type
  TOMScxBarEditItem = class(TcxBarEditItem)
  private

  protected
    procedure Loaded; override;

  published
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses uDialogs, cxDBLookupComboBox, cxDropDownEdit, uOMSStyle, cxEdit;

constructor TOMScxBarEditItem.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TOMScxBarEditItem.Loaded;
begin
  inherited;

  if (Properties is TcxLookupComboBoxProperties) then
  with (Properties as TcxLookupComboBoxProperties) do
  begin
    DropDownListStyle := lsEditFixedList;
//    ImmediatePost := True;
    ListOptions.CaseInsensitive := True;

    if ListColumns.Count = 1
      then ListOptions.ShowHeader := False;

    if DropDownRows < 20
      then DropDownRows := 20;
    if DropDownWidth < 600
      then DropDownWidth := 600;
  end;

  if (Properties is TcxCustomEditProperties) then
  with (Properties as TcxCustomEditProperties) do
  begin
    ImmediatePost := True;
  end;

  //ShowInformation( Properties.ClassName );
  // TcxLabelProperties, TcxLookupComboBoxProperties, TcxCheckBoxProperties
  //  OnMouseWheel := MouseWheelHandler;
end;

end.
