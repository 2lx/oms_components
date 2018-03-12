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
  TOMScxGridViewCommon = class (TcxCustomGridView)
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

uses uOMSStyle, cxGridDBTableView, cxButtonEdit, cxDBExtLookupComboBox, cxDBLookupComboBox,
    cxSpinEdit, cxGridTableView;

class procedure TOMScxGridViewCommon.GridViewInitEditHandler( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit );
begin
  if AEdit is TcxLookupComboBox
    then TcxLookupComboBox(AEdit).Properties.UseMouseWheel := False
  else if AEdit is TcxSpinEdit
    then TcxSpinEdit(AEdit).Properties.UseMouseWheel := False
  else if AEdit is TcxExtLookupComboBox
    then TcxExtLookupComboBox(AEdit).Properties.UseMouseWheel := False;
end;

function checkInvalidStyle(var ARecord: TcxCustomGridRecord; var AItem: TcxCustomGridTableItem) : Boolean;
begin
  Result := (ARecord = Nil) OR ( AItem = Nil ) OR (ARecord.Index = -1);
end;

procedure setupStyleGridBefore( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle; isHLCursor : Boolean );
begin
 if ( isHLCursor ) AND ( Sender.DataController.FocusedRowIndex = ARecord.Index )
   then AStyle := cxStyleContentCursor
  { else if Odd( ARecord.Index )
      then AStyle := cxStyleContentDefault
      else AStyle := cxStyleContentOdd;       }
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
