unit uOMSForm;

interface

uses VCL.Forms, Classes, DataModule, Vcl.Controls, Vcl.ComCtrls, Data.DB,
    ExtCtrls, Windows, WinAPI.Messages, cxStyles, Vcl.Graphics,
    uOMSLayout, uAppMessages, uDataBase, System.Generics.Collections,

 {$I OMSComponentsInclude.inc}

const
  clOMSErrorRed       = TColor( $7F7FFF );
  clOMSAmarant        = TColor( $4B2AE6 );
	clOMSLightGray      = TColor( $DFDFDF );
  clOMSWhite          = TColor( $FFFFFF );
  clOMSLightBlue      = TColor( $FFF0E1 );
  clOMSLightPurple    = TColor( $F3B0F3 );
  clOMSReportGreen = TColor( $99FFCC );

  clOMSLightRed       = TColor( $CFCFFF );
  clOMSBlue           = TColor( $FFB164 );
  clOMSFormPurple     = TColor( $DCAAB4 );
  clOMSFormGreen      = TColor( $BFFFBF );
  clOMSBrightGreen    = TColor( $9BFF9B );
  clOMSDarkRedGray    = TColor( $8B60A8 );
  clOMSTableGreen     = TColor( $7DE04E );
  clOMSDarkGray       = TColor( $505050 );
  clOMSLightGreen     = TColor( $62E689 );
  clOMSYellow         = TColor( $00F0FF );
  clOMSBlack          = TColor( $000000 );
  clOMSLightPink      = TColor( $C998FF );
  clOMSCoral          = TColor( $0E0EC8 );
  clOMSFontBlue       = TColor( $D06600 );

type
  TMDIChildType = ( mdictUnique, mdictMultiple );

  TOMSForm = class abstract( TForm )
  private
    FGUID: Variant;
    FMDIChildType: TMDIChildType;
    FLayouts : TFormLayouts;
    FADOQOpeningCount : Integer;
    FDBUIN : String;

    FADOQList : TList<TOMSADOQuery>;

    procedure CreateCommon;

    procedure OnADOQBeginMessage(var Msg: TMessage); message WM_ADOQ_BEGIN_MESSAGE;
    procedure OnADOQEndMessage(var Msg: TMessage); message WM_ADOQ_END_MESSAGE;
    procedure OnFormAfterShow(var Msg: TMessage); message WM_MDIFORM_AFTER_SHOW;

    procedure DoShow; override;

  protected
    procedure CreateAccessRules; virtual;
    procedure InsertLayouts; virtual;
    procedure RestoreUserSettings; virtual;
    procedure SaveUserSettings; virtual;

    procedure FormClose(Sender: TObject; var Action: TCloseAction); virtual;

    function CheckAcceptData: WideString;
    function CheckData: WideString;

    procedure Resize; override;

    procedure AddRule( cmpn: TComponent; const arrCmpns : array of TComponent;
        const commentBase : WideString = '' );
    procedure AddGridRules( gridView: TOMScxGridDBTableView );

    // deprecated:
    function AddLayout( const Count, ColumnCount, LabelWidth: Integer;
        compPanel: TControl; const iGridHeight: Integer; const BeetweenW : Integer = 10 ) : Integer; deprecated;
    procedure AddLayoutCell( const GridID : Integer; compLbl, compEdit: TControl;
        const iLeft, iTop, iWidth, iHeight: Integer ); deprecated;

    procedure AddComponentGridFullAccess( gView: TOMScxGridDBTableView;
        const FrameName : WideString = ''; const NamePostfix : WideString = '' ); deprecated;
    procedure AddComponentAccess( Component: TComponent;
        const FrameName : WideString = ''; const NamePostfix : WideString = '' ); deprecated;
    procedure AddComponentGroupAccess( ComponentLBL: TComponent; ComponentArray: array of TComponent;
        const FrameName : WideString = ''; const NamePostfix : WideString = '' ); deprecated;

  public
    property MDIChildType : TMDIChildType read FMDIChildType;
    property ObjGUID : Variant read FGUID;
    property DBUIN : String read FDBUIN;
    property Layouts : TFormLayouts read FLayouts;

    constructor Create( AOwner: TComponent ); overload; virtual;
    constructor Create( AOwner: TComponent; const guid: Variant ); overload; virtual;
    destructor Destroy; override;

    procedure SetupRightsRestriction; virtual;

    function CheckAllQueries: Boolean;
    procedure PostAllQueries;
    procedure CancelAllQueries;
    procedure CloseAllQueries;

    procedure InitializeRights;
    function CanCloseCheckQueriesStates: Boolean;
    function CanCloseCheckRequiredFields( const canDelete: Boolean = False ): Boolean;

    function DBProcedure( procName: String; const params: array of Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo') : Boolean;
    function DBProcedureResult( procName: String; const params: array of Variant; var RValue: Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo'; isAsync : Boolean = False ) : Boolean;
    function DBFunction( funcName: String; const params: array of Variant; var RValue: Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
    function DBUpdateTable( const tableName, keyFieldName : String; const keyFieldValue: Variant;
        const updatedFieldName : String; updatedFieldValue : Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
  end;

implementation

uses uUserSettings, ADODB, Variants, System.SysUtils, VCL.Dialogs, cxCheckBox, dxBar, ActnList, StdCtrls, cxSpinEdit,
  cxGridDBBandedTableView, TypInfo,  dxRibbon, main, cxImage, cxDBLabel, cxDropDownEdit, cxDBExtLookupComboBox,
  UnitDifFuncs, cxGridDBCardView, cxNavigator, ShellAPI, UnitOMSFormBaseInterface,  UnitFileRoutines, cxCalendar,
  cxCurrencyEdit, cxTextEdit, cxGraphics, UnitDataOMSREF, cxTimeEdit, cxMemo, uOMSStyle,
  uDialogs, dxGDIPlusClasses, cxGridDBTableView, cxBarEditItem, cxGrid, cxPC, cxButtons,  uAccessRules;

//------------------------------------------------------------------------------

constructor TOMSForm.Create(AOwner: TComponent; const guid: Variant);
var
  fRet : Variant;
begin
  inherited Create( AOwner );

  FMDIChildType := mdictMultiple;
  FGUID := guid;

  if DBFunction( 'OMS_OBJECT_GetUNumber', [ ObjGUID ], fRet ) AND (not VarIsNull( fRet ))
    then FDBUIN := 'УИН: ' + VarToStr( fRet );

  CreateCommon;
end;

constructor TOMSForm.Create(AOwner: TComponent);
begin
  Inherited Create( AOwner );

  FMDIChildType := mdictUnique;
  FGUID := NULL;
  FDBUIN := '';

  if not Assigned( onClose )
    then ShowMessage( 'Необходимо имплементировать событие onClose и обNilить указатель экземпляра' );

  CreateCommon;
end;

procedure TOMSForm.CreateCommon;

  procedure PopulateAdoQList( frm : TComponent );
  var
    i : Integer;
  begin
    for i := 0 to frm.ComponentCount - 1 do
    begin
      if ( frm.Components[ i ] is TFrame )
        then PopulateAdoQList( frm.Components[ i ] as TFrame )
      else if ( frm.Components[ i ] is TOMSADOQuery )
          then FADOQList.Add( frm.Components[ i ] as TOMSADOQuery );
    end;
  end;

begin
  FADOQOpeningCount := 0;

  FLayouts := TFormLayouts.Create;

  RestoreUserSettings;

{$IFDEF DEBUG}
  CreateAccessRules;
{$ENDIF}

  InsertLayouts;

  if not Assigned( onClose )
    then onClose := FormClose;

  FADOQList := TList<TOMSADOQuery>.Create;
  PopulateAdoQList( Self );
end;

destructor TOMSForm.Destroy;
begin
  FLayouts.Free;
  FADOQList.Free;

  inherited;
end;

procedure TOMSForm.DoShow;
begin
  inherited;

  PostMessage(Self.Handle, WM_MDIFORM_AFTER_SHOW, 0, 0);
  if (Owner is TWinControl)
    then PostMessage((Owner as TWinControl).Handle, WM_MDIFORM_AFTER_SHOW, 0, 0);
end;

procedure TOMSForm.OnFormAfterShow(var Msg: TMessage);
var
  interfEditor : IOMSFormBaseInterfaceEditor;
  interfRefresh : IOMSFormBaseInterfaceRefresh;
begin
  InitializeRights;

  if ( GetInterface( IOMSFormBaseInterfaceEditor, interfEditor ) )
    then interfEditor.RefreshData
  else if ( GetInterface( IOMSFormBaseInterfaceRefresh, interfRefresh ) )
    then interfRefresh.RefreshData;

  SetupRightsRestriction;
end;

//--------------------------------------------------------------------------------------------------

function TOMSForm.CheckData: WideString;
begin
  Result := DataForm.SelectOMSCheckRequiredFields( ObjGUID );
end;

function TOMSForm.CheckAcceptData: WideString;
begin
  Result := DataForm.SelectOMSCheckAcceptFields( ObjGUID );
end;

//------------------------------------------------------------------------------

procedure TOMSForm.CreateAccessRules;
begin

end;

procedure TOMSForm.InsertLayouts;
begin

end;

procedure TOMSForm.RestoreUserSettings;
begin

end;

procedure TOMSForm.SaveUserSettings;
begin

end;

procedure TOMSForm.SetupRightsRestriction;
begin

end;

function TOMSForm.DBProcedure( procName: String; const params: array of Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo') : Boolean;
begin
  Result := DBProcedureOwner( Self, procName, params, dbCatalog, dbScheme );
end;

function TOMSForm.DBProcedureResult( procName: String; const params: array of Variant; var RValue: Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo'; isAsync : Boolean = False ) : Boolean;
begin
  Result := DBProcedureResultOwner( Self, procName, params, RValue, dbCatalog, dbScheme, False );
end;

function TOMSForm.DBFunction( funcName: String; const params: array of Variant; var RValue: Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
begin
  Result := DBFunctionOwner( Self, funcName, params, RValue, dbCatalog, dbScheme );
end;

function TOMSForm.DBUpdateTable( const tableName, keyFieldName : String; const keyFieldValue: Variant;
        const updatedFieldName : String; updatedFieldValue : Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
begin
  Result := DBUpdateTableOwner( Self, tableName, keyFieldName, keyFieldValue, updatedFieldName,
      updatedFieldValue, dbCatalog, dbScheme );
end;

procedure TOMSForm.OnADOQBeginMessage(var Msg: TMessage);
begin
  Inc(FADOQOpeningCount);
  if FADOQOpeningCount <= 0 then Exit;

  frmMain.lblAnimationADOQ.Visible := True;
  frmMain.imgAnimationADOQ.Visible := True;
  TdxSmartImage( frmMain.imgAnimationADOQ.Picture.Graphic).StartAnimation;
end;

procedure TOMSForm.OnADOQEndMessage(var Msg: TMessage);
begin
  Dec(FADOQOpeningCount);
  if FADOQOpeningCount > 0 then Exit;

  frmMain.lblAnimationADOQ.Visible := False;
  frmMain.imgAnimationADOQ.Visible := False;
  TdxSmartImage( frmMain.imgAnimationADOQ.Picture.Graphic).StopAnimation;
end;

//------------------------------------------------------------------------------

procedure TOMSForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  CloseAllQueries;

  inherited;
end;

//------------------------------------------------------------------------------

procedure TOMSForm.PostAllQueries;
var
  adoq : TOMSADOQuery;
begin
  for adoq in FADOQList do
    adoq.SafePost;
end;

procedure TOMSForm.CancelAllQueries;
var
  adoq : TOMSADOQuery;
begin
  for adoq in FADOQList do
    adoq.SafeCancel;
end;

function TOMSForm.CheckAllQueries : Boolean;
var
  adoq : TOMSADOQuery;
begin
  Result := False;

  for adoq in FADOQList do
    if adoq.IsEdited then begin
      Result := True;
      Break;
    end;
end;

procedure TOMSForm.CloseAllQueries;
var
  adoq : TOMSADOQuery;
begin
  for adoq in FADOQList do
    adoq.SafeClose;
end;

function TOMSForm.CanCloseCheckQueriesStates: Boolean;
var
  interfEditor : IOMSFormBaseInterfaceEditor;
begin
  Result := True;

  if CheckAllQueries then
  begin
    if ShowQuestionYesNo( 'Данные были изменены, СОХРАНИТЬ?' ) then
      begin
        if ( GetInterface( IOMSFormBaseInterfaceEditor, interfEditor ) )
          then interfEditor.PostData
          else PostAllQueries;
      end
      else
      begin
        if ( GetInterface( IOMSFormBaseInterfaceEditor, interfEditor ) )
          then interfEditor.CancelData
          else CancelAllQueries;
      end;
  end;
end;

function TOMSForm.CanCloseCheckRequiredFields(const canDelete: Boolean) : Boolean;
var
  strErr: WideString;
begin
  Result := True;
  strErr := CheckData;

  if ( strErr <> '' ) then
  begin
    if ( canDelete ) then
    begin
      if ShowQuestionYesNo( strErr + '. Вы уверены, что хотите УДАЛИТЬ запись?' )
        then DataForm.DeleteOMSObject( ObjGUID )
        else Result := False;
    end
    else if not ShowQuestionYesNo( strErr + '. Вы уверены, что хотите ЗАКРЫТЬ окно?' )
            then Result := False;
  end;
end;

//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

procedure TOMSForm.AddRule(cmpn: TComponent; const arrCmpns: array of TComponent;
  const commentBase: WideString);
begin
  AddAccessRule( cmpn, arrCmpns, commentBase );
end;

procedure TOMSForm.AddGridRules(gridView: TOMScxGridDBTableView);
begin
  AddGridAccessRules( gridView );
end;

// deprecated:
procedure TOMSForm.AddComponentGridFullAccess( gView: TOMScxGridDBTableView;
    const FrameName : WideString = ''; const NamePostfix : WideString = '' );
begin
  AddGridAccessRules( gView );
end;

procedure TOMSForm.AddComponentAccess( Component: TComponent; const FrameName : WideString = '';
  const NamePostfix : WideString = '' );
begin
  AddAccessRule( Component, [ ], NamePostfix );
end;

procedure TOMSForm.AddComponentGroupAccess( ComponentLBL: TComponent;
    ComponentArray: array of TComponent; const FrameName : WideString = '';
    const NamePostfix : WideString = '' );
begin
  AddAccessRule( ComponentLBL, ComponentArray, NamePostfix );
end;

procedure TOMSForm.InitializeRights;
begin
  ApplyAccessRules( Self );
  Resize;
end;

//------------------------------------------------------------------------------

function TOMSForm.AddLayout( const Count, ColumnCount, LabelWidth: Integer; compPanel: TControl;
    const iGridHeight: Integer; const BeetweenW : Integer = 10 ): Integer;
begin
  Result := FLayouts.AddLayout( compPanel, ColumnCount, iGridHeight, LabelWidth, BeetweenW );
end;

procedure TOMSForm.AddLayoutCell( const GridID : Integer; compLbl, compEdit: TControl;
  const iLeft, iTop, iWidth, iHeight: Integer );
begin
  FLayouts.AddLayoutCell( GridID, compLbl, compEdit, iLeft, iTop, iWidth, iHeight );
end;

procedure TOMSForm.Resize;
begin
  inherited;

  Scaled := False;
  FLayouts.Resize;
end;

end.
