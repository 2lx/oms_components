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

uses uDialogs, cxDBLookupComboBox, cxDropDownEdit, uOMSStyle, cxEdit, cxLookupEdit, cxCalendar;

constructor TOMScxBarEditItem.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TOMScxBarEditItem.Loaded;
begin
  inherited;

  if Properties is TcxCustomEditProperties then
  with Properties as TcxCustomEditProperties do
  begin
    UseMouseWheel := False;
    ImmediatePost := True;
  end;

  if Properties is TcxCustomLookupEditProperties then
  with Properties as TcxCustomLookupEditProperties do
  begin
    if DropDownRows < 20
      then DropDownRows := 20;
    if DropDownWidth < 600
      then DropDownWidth := 600;
  end;

  if Properties is TcxLookupComboBoxProperties then
  with Properties as TcxLookupComboBoxProperties do
  begin
    DropDownListStyle := lsEditFixedList;
    ListOptions.CaseInsensitive := True;

    if ListColumns.Count = 1
      then ListOptions.ShowHeader := False;
  end;

  if Properties is TcxCustomDateEditProperties then
  with Properties as TcxCustomDateEditProperties do
  begin
    DisplayFormat := 'dd.mm.yy';
    EditFormat := 'dd.mm.yy';
  end;
end;

end.
