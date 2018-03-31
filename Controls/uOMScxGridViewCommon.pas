unit uOMScxGridViewCommon;

interface

uses cxStyles, cxGridCustomTableView, cxEdit, cxGridCustomView;

type
  TGridSelectionType = (
      gstNone,
      gstOneCellOneRow,
      gstMultiCellMultiRow
  );

  TPFuncGUIDBoolean = reference to function( const guid: Variant ) : Boolean;

  TProcNavigatorOnButtonClick = procedure( Sender: TObject; AButtonIndex: Integer; var ADone: Boolean ) of object;
  TProcContentStyle = procedure( Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle ) of object;

type
  TOMScxGridViewCommon = class
  public
    class procedure GridViewInitEditHandler(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit);
  end;

function checkInvalidStyle(var ARecord: TcxCustomGridRecord; var AItem: TcxCustomGridTableItem) : Boolean;

procedure setupStyleGridBefore( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle; isHLCursor : Boolean = True );
procedure setupStyleGridAfter( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );

implementation

uses uOMSComponentStyle, cxGridDBTableView, cxButtonEdit, cxDBExtLookupComboBox, cxDBLookupComboBox,
    cxSpinEdit, cxGridTableView, cxLookupEdit, uDialogs, cxMaskEdit;

class procedure TOMScxGridViewCommon.GridViewInitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );
begin
  if AEdit is TcxCustomMaskEdit then
  with AEdit as TcxCustomMaskEdit do
  begin
    Properties.UseMouseWheel := False;
//    Properties.ImmediatePost := True;
  end;

  if AEdit is TcxCustomLookupEdit then
  with AEdit as TcxCustomLookupEdit do
  begin
    if Properties.DropDownRows < 20
      then Properties.DropDownRows := 20;
    if Properties.DropDownWidth < 600
      then Properties.DropDownWidth := 600;
  end;

  if AEdit is TcxCustomLookupComboBox then
  with AEdit as TcxCustomLookupComboBox do
  begin
    if Properties.ListColumns.Count = 1
      then Properties.ListOptions.ShowHeader := False;
  end;
end;

function checkInvalidStyle(var ARecord: TcxCustomGridRecord; var AItem: TcxCustomGridTableItem) : Boolean;
begin
  Result := (ARecord = Nil) OR ( AItem = Nil ) OR (ARecord.Index = -1) OR (not ARecord.IsData);
end;

procedure setupStyleGridBefore( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle; isHLCursor : Boolean );
begin
 if ( isHLCursor ) AND ( Sender.DataController.FocusedRowIndex = ARecord.Index )
   then AStyle := cxStyleContentCursor;
{   else if Odd( ARecord.Index )
      then AStyle := cxStyleContentDefault
      else AStyle := cxStyleContentOdd; }
end;

procedure setupStyleGridAfter( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );
var
  AColumn: TcxCustomGridColumn;
begin
  AColumn := Sender.DataController.GetItem(AItem.Index) as TcxCustomGridColumn;

  if ( AItem <> Nil ) AND ( AItem.Options.Editing ) AND ( Sender.OptionsData.Editing )
      AND not (AColumn.Properties is TcxButtonEditProperties)
    then AStyle := cxStyleContentEditable;
end;

end.
