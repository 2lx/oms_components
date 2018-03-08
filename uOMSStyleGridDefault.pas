unit uOMSStyleGridDefault;

interface

uses cxStyles, cxGridCustomTableView;

function checkInvalidStyle(var ARecord: TcxCustomGridRecord; var AItem: TcxCustomGridTableItem) : Boolean;

procedure setupStyleGridBefore( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle; isHLCursor : Boolean = True );
procedure setupStyleGridAfter( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );

implementation

uses uOMSStyle, cxGridDBTableView, cxButtonEdit;

function checkInvalidStyle(var ARecord: TcxCustomGridRecord; var AItem: TcxCustomGridTableItem) : Boolean;
begin
  Result := (ARecord = Nil) OR ( AItem = Nil ) OR (ARecord.Index = -1);
end;

procedure setupStyleGridBefore( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle; isHLCursor : Boolean );
begin
 if ( isHLCursor ) AND ( Sender.DataController.FocusedRowIndex = ARecord.Index )
   then AStyle := cxStyleContentCursor
   else if Odd( ARecord.Index )
      then AStyle := cxStyleContentDefault
      else AStyle := cxStyleContentOdd;
end;

procedure setupStyleGridAfter( var Sender: TcxCustomGridTableView; var ARecord: TcxCustomGridRecord;
      var AItem: TcxCustomGridTableItem; var AStyle: TcxStyle );
var
  AColumn: TcxGridDBColumn;
begin
  AColumn := Sender.DataController.GetItem(AItem.Index) as TcxGridDBColumn;

  if ( AItem <> Nil ) AND ( AItem.Options.Editing ) AND ( Sender.OptionsData.Editing )
      AND not (AColumn.Properties is TcxButtonEditProperties)
    then AStyle := cxStyleContentEditable;
end;

end.
