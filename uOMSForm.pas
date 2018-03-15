unit uOMSForm;

interface

uses VCL.Forms, Classes, DataModule, Vcl.Controls, Vcl.ComCtrls, Data.DB,
    ExtCtrls, Windows, WinAPI.Messages, cxStyles, Vcl.Graphics,
    uOMSLayout, uAppMessages, uDataBase, System.Generics.Collections,

 {$I OMSComponentsInclude.inc}

const
//{
  clOMSErrorRed       = TColor( $7F7FFF );
  clOMSAmarant        = TColor( $4B2AE6 );
	clOMSLightGray      = TColor( $DFDFDF );
  clOMSWhite          = TColor( $FFFFFF );
  clOMSLightBlue      = TColor( $FFF0E1 );
  clOMSLightPurple    = TColor( $F3B0F3 );
  clOMSExcelGreenTitle = TColor( $99FFCC );

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
//  clOMSOrange         = TColor( $13AAFA );
  clOMSBlack          = TColor( $000000 );
{  clOMSTurkey         = TColor( $E0E0FF );
  clOMSChina          = TColor( $E0FFE0 );
  clOMSUzbekistan     = TColor( $E0FFFF );
  clOMSRussia         = TColor( $FFFFE0 );
}  clOMSLightPink      = TColor( $C998FF );
  clOMSCoral          = TColor( $0E0EC8 );
  clOMSFontBlue       = TColor( $D06600 );

//  clOMSSoftRed        = TColor( $D0BBF8 );
//  clOMSSoftGreen      = TColor( $C9E6C8 );
//  clOMSSoftBlue       = TColor( $FCE5B3 );
//}
  //Report colors
  clOMSReport1        = TColor( $FFCC99 );
  clOMSReport2        = TColor( $99FFFF );
  clOMSReport3        = TColor( $CC99FF );
  clOMSReport4        = TColor( $FFFF99 );
  clOMSReport5        = TColor( $FF99CC );
  clOMSReport6        = TColor( $FF99FF );
  clOMSReport7        = TColor( $CCFF99 );
  clOMSReport8        = TColor( $99FFCC );
  clOMSReport9        = TColor( $CC99CC );
  clOMSReport10       = TColor( $99CCFF );
  clOMSReport11       = TColor( $99CCCC );
  clOMSReport12       = TColor( $CCFFFF );
  clOMSReport13       = TColor( $CCCC99 );
  clOMSReport14       = TColor( $CCCCCC );

  clOMSReportDark1    = TColor( $FFAA44 );
  clOMSReportDark2    = TColor( $40E3E3 );
  clOMSReportDark3    = TColor( $AA44FF );
  clOMSReportDark4    = TColor( $E0E036 );
  clOMSReportDark5    = TColor( $ED4097 );
  clOMSReportDark6    = TColor( $ED45ED );
  clOMSReportDark7    = TColor( $93E640 );
  clOMSReportDark14   = TColor( $AAAAAA );


  clOMSArrayReportColors: array[1..13] of TColor = ( clOMSReport1, clOMSReport2, clOMSReport3,
      clOMSReport4,  clOMSReport5, clOMSReport6, clOMSReport7, clOMSReport8,
      clOMSReport9, clOMSReport10, clOMSReport11, clOMSReport12, clOMSReport13 );

type
  TMDIChildType = ( mdictUnique, mdictMultiple );

  TOMSForm = class abstract( TForm )
  private
    FGUID: Variant;
    FMDIChildType: TMDIChildType;
    FLayouts : TFormLayouts;
    FIsWasFirstLoaded : Boolean;
    FADOQOpeningCount : Integer;

    FADOQList : TList<TOMSADOQuery>;

    procedure CreateCommon;

    procedure OnADOQBeginMessage(var Msg: TMessage); message WM_ADOQ_BEGIN_MESSAGE;
    procedure OnADOQEndMessage(var Msg: TMessage); message WM_ADOQ_END_MESSAGE;
    procedure OnFormAfterShow(var Msg: TMessage); message WM_FORM_AFTER_SHOW;

    procedure DoShow; override;

  protected
    procedure InsertControlComponents; virtual;
    procedure InsertLayouts; virtual;
    procedure RestoreUserSettings; virtual;
    procedure SaveUserSettings; virtual;

    procedure FormClose(Sender: TObject; var Action: TCloseAction); virtual;

    function CheckAcceptData: WideString;
    function CheckData: WideString;

    procedure Resize; override;

    // deprecated:
    function AddLayout( const Count, ColumnCount, LabelWidth: Integer;
        compPanel: TControl; const iGridHeight: Integer; const BeetweenW : Integer = 10 ) : Integer; deprecated;
    procedure AddLayoutCell( const GridID : Integer; compLbl, compEdit: TControl;
        const iLeft, iTop, iWidth, iHeight: Integer ); deprecated;

   procedure AddComponentGridFullAccess( gView: TOMScxGridDBTableView;
        const FrameName : WideString = ''; const NamePostfix : WideString = '' );
    procedure AddComponentAccess( Component: TComponent;
        const FrameName : WideString = ''; const NamePostfix : WideString = '' );
    procedure AddComponentGroupAccess( ComponentLBL: TComponent; ComponentArray: array of TComponent;
        const FrameName : WideString = ''; const NamePostfix : WideString = '' );

//    procedure ModifyFontsFor( ctrl: TWinControl; const FontSize: Integer );

  public
    property ObjGUID : Variant read FGUID;
    property Layouts : TFormLayouts read FLayouts;
    property IsWasFirstLoaded : Boolean read FIsWasFirstLoaded;

    constructor Create( AOwner: TComponent ); overload; virtual;
    constructor Create( AOwner: TComponent; const guid: Variant ); overload; virtual;
    destructor Destroy; override;

    procedure InitializeRights; virtual; final;
    procedure SetupRightsRestriction; virtual;

    function CheckAllQueries: Boolean;
    procedure PostAllQueries;
    procedure CancelAllQueries;
    procedure CloseAllQueries;
    procedure DisableAllQueries;
    procedure EnableAllQueries;

    function CanCloseCheckQueriesStates: Boolean;
    function CanCloseCheckRequiredFields( const canDelete: Boolean = False ): Boolean;

    function DBProcedure( procName: String; const params: array of Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo') : Boolean;

    function DBProcedureResult( procName: String; const params: array of Variant; var RValue: Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo'; isAsync : Boolean = False ) : Boolean;

    function DBFunction( funcName: String; const params: array of Variant; var RValue: Variant;
        const dbCatalog : TDBCatalog = dbOrders; const dbScheme: String = 'dbo' ) : Boolean;
  end;

implementation

uses uUserSettings, ADODB, Variants, System.SysUtils, VCL.Dialogs, cxCheckBox, dxBar, ActnList, StdCtrls, cxSpinEdit,
  cxGridDBBandedTableView, TypInfo,  dxRibbon, main, cxImage, cxDBLabel, cxDropDownEdit, cxDBExtLookupComboBox,
  UnitDifFuncs, cxGridDBCardView, cxNavigator, ShellAPI, UnitOMSFormBaseInterface,  UnitFileRoutines, cxCalendar,
  cxCurrencyEdit, cxTextEdit, cxGraphics, UnitDataOMSREF, cxTimeEdit, cxMemo, uOMSStyle,
  uOMSDialogs, dxGDIPlusClasses, cxGridDBTableView, cxBarEditItem, cxGrid, cxPC, cxButtons;

//------------------------------------------------------------------------------

constructor TOMSForm.Create(AOwner: TComponent; const guid: Variant);
begin
  inherited Create( AOwner );

  FADOQOpeningCount := 0;
  FGUID := guid;
  FMDIChildType := mdictMultiple;

  CreateCommon;
end;

constructor TOMSForm.Create(AOwner: TComponent);
begin
  Inherited Create( AOwner );

  FADOQOpeningCount := 0;
  FGUID := NULL;
  FMDIChildType := mdictUnique;

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
  FLayouts := TFormLayouts.Create;
  FIsWasFirstLoaded := False;

  RestoreUserSettings;

{$IFDEF DEBUG}
//  InsertControlComponents;
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

  PostMessage(Self.Handle, WM_FORM_AFTER_SHOW, 0, 0);
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

procedure TOMSForm.InsertControlComponents;
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

procedure TOMSForm.OnADOQBeginMessage(var Msg: TMessage);
begin
  Inc(FADOQOpeningCount);
  if FADOQOpeningCount <= 0 then Exit;

//  DisableAllQueries;
  OMSMainForm.lblAnimationADOQ.Visible := True;
  OMSMainForm.imgAnimationADOQ.Visible := True;
  TdxSmartImage( OMSMainForm.imgAnimationADOQ.Picture.Graphic).StartAnimation;
end;

procedure TOMSForm.OnADOQEndMessage(var Msg: TMessage);
begin
  Dec(FADOQOpeningCount);
  if FADOQOpeningCount > 0 then Exit;

  OMSMainForm.lblAnimationADOQ.Visible := False;
  OMSMainForm.imgAnimationADOQ.Visible := False;
  TdxSmartImage( OMSMainForm.imgAnimationADOQ.Picture.Graphic).StopAnimation;
//  EnableAllQueries;
end;

{
procedure TOMSFormBase.ModifyFontsFor( ctrl: TWinControl; const FontSize: Integer );

  procedure ModifyFont( ctrl: TControl; const FontSize: Integer );
  var
    font: TFont;
    style: TcxStyle;
    rfonts : TdxRibbonFonts;
    PropInfo : PPropInfo;
  begin
    if IsPublishedProp( ctrl, 'ParentFont' ) then
    begin
       PropInfo := GetPropInfo( ctrl, 'ParentFont', [] );
       SetPropValue( ctrl, PropInfo, True );
    end;
    if IsPublishedProp( ctrl, 'ParentColor' ) then
    begin
       PropInfo := GetPropInfo( ctrl, 'ParentColor', [] );
       SetPropValue( ctrl, PropInfo, False );
    end;

    if IsPublishedProp( ctrl, 'font' ) then
    begin
      font := TFont( GetObjectProp(ctrl, 'font', TFont));
      font.Size := FontSize;
      SetObjectProp( ctrl, 'font', font );
    end;
    if IsPublishedProp( ctrl, 'style' ) AND ( not ( ctrl is TdxRibbon ) )
        AND ( not ( ctrl is TPageControl ) ) then
    begin
      style := TcxStyle( GetObjectProp( ctrl, 'style', TcxStyle ) );
      if style <> Nil then
      begin
        style.Font.Size := FontSize;
        SetObjectProp( ctrl, 'style', style );
      end;
    end;
    if IsPublishedProp( ctrl, 'fonts' ) AND ( ctrl is TdxRibbon )then
    begin
      rfonts := TdxRibbonFonts( GetObjectProp( ctrl, 'fonts', TdxRibbonFonts ) );
      rfonts.ApplicationButton.Size := FontSize;
      rfonts.Group.Size := FontSize;
      rfonts.GroupHeader.Size := FontSize;
      rfonts.TabHeader.Size := FontSize;
      SetObjectProp( ctrl, 'fonts', rfonts );
    end;
  end;

var
  i: Integer;
begin
  ShowHint := True;
  ModifyFont( ctrl, FontSize );
  for i := 0 to ctrl.controlcount - 1 do
    if ctrl.controls[i] is Twincontrol then
      ModifyFontsfor( TWincontrol( ctrl.controls[ i ] ), FontSize )
    else
      Modifyfont( ctrl.controls[ i ], FontSize );
end;
}
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

procedure TOMSForm.DisableAllQueries;
var
  adoq : TOMSADOQuery;
begin
  for adoq in FADOQList do
    adoq.DisableControls;
end;

procedure TOMSForm.EnableAllQueries;
var
  adoq : TOMSADOQuery;
begin
  for adoq in FADOQList do
    adoq.EnableControls;
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

procedure TOMSForm.AddComponentGridFullAccess( gView: TOMScxGridDBTableView;
    const FrameName : WideString = ''; const NamePostfix : WideString = '' );
var
  i : Integer;
begin
  AddComponentAccess( gView, FrameName, 'таблица ' + NamePostfix );

  for i := 0 to gView.ColumnCount - 1 do
    if ( gView.Columns[ i ].Width <> 0 )
      then AddComponentAccess( gView.Columns[ i ], FrameName, 'столбец таблицы ' + NamePostfix );
end;

procedure TOMSForm.AddComponentAccess( Component: TComponent; const FrameName : WideString = '';
  const NamePostfix : WideString = '' );
var
  CompType: Integer;
  LabelRussian: WideString;
  bbtn : TdxBarLargeButton;
  bsmbtn : TdxBarButton;
  cxBEI: TcxBarEditItem;
  gridDBTableView: TOMScxGridDBTableView;
  gridDBBandedTableView: TOMScxGridDBBandedTableView;
  gridDBColumn: TcxGridDBColumn;
  isVisible, isEnable : Boolean;
  FormGUID, CompOneTGUID, CompGUID : Variant;
begin
  try
//    Control := TControl( Component );
    if ( Component is TcxGrid ) then Exit;

    LabelRussian := '';
    if ( Component is TcxLabel )
      then LabelRussian := ( Component AS TOMScxLabel ).Caption
    else if ( Component is TOMScxDBCheckBox )
      then LabelRussian := ( Component AS TOMScxDBCheckBox ).Caption
    else if ( Component is TOMScxCheckBox )
      then LabelRussian := ( Component AS TOMScxCheckBox ).Caption
    else if ( Component is TTabSheet )
      then LabelRussian := ( Component AS TTabSheet ).Caption
    else if ( Component is TcxTabSheet )
      then LabelRussian := ( Component AS TcxTabSheet ).Caption
    else if ( Component is TcxButton )
      then LabelRussian := ( Component AS TcxButton ).Caption
    else if ( Component is TdxBarLargeButton )
      then begin
        bbtn := TdxBarLargeButton( Component );
        LabelRussian := bbtn.Caption;
      end
    else if ( Component is TdxBarButton )
      then begin
        bsmbtn := TdxBarButton( Component );
        LabelRussian := bsmbtn.Caption;
      end
    else if ( Component is TOMScxGridDBTableView )
      then begin
        LabelRussian := 'Таблица';
        gridDBTableView := TOMScxGridDBTableView( Component );
      end
    else if ( Component is TOMScxGridDBBandedTableView )
      then begin
        LabelRussian := 'Таблица';
        gridDBBandedTableView := TOMScxGridDBBandedTableView( Component );
      end
    else if ( Component is TcxBarEditItem )
      then begin
        LabelRussian := ( Component as TcxBarEditItem ).Caption;
      end
    else if ( Component is TcxGridDBColumn )
      then begin
        gridDBColumn := TcxGridDBColumn( Component );
        LabelRussian := gridDBColumn.Caption;
      end;

    if ( Component is TTabSheet )
      then isVisible := ( Component AS TTabSheet ).TabVisible
    else if ( Component is TcxTabSheet )
      then isVisible := ( Component AS TcxTabSheet ).TabVisible
    else if ( Component is TdxBarLargeButton )
      then isVisible := bbtn.Visible = ivAlways
    else if ( Component is TcxBarEditItem )
      then isVisible := cxBEI.Visible = ivAlways
    else if ( Component is TOMScxGridDBTableView )
      then isVisible := ( gridDBTableView.Control as TcxGrid ).Visible
    else if ( Component is TOMScxGridDBBandedTableView )
      then isVisible := ( gridDBBandedTableView.Control as TcxGrid ).Visible
    else if ( Component is TcxGridDBColumn )
      then isVisible := gridDBColumn.Visible
    else if ( Component is TdxBarButton )
      then isVisible := bsmbtn.Visible = ivAlways
    else isVisible := ( Component AS TControl ).Visible;

    if ( Component is TdxBarLargeButton )
      then isEnable := bbtn.Enabled
    else if ( Component is TdxBarButton )
      then isEnable := bsmbtn.Enabled
    else if ( Component is TcxBarEditItem )
      then isEnable := cxBEI.Enabled
    else if ( Component is TOMScxGridDBTableView )
      then isEnable := gridDBTableView.OptionsData.Editing
    else if ( Component is TOMScxGridDBBandedTableView )
      then isEnable := gridDBBandedTableView.OptionsData.Editing
    else if ( Component is TcxGridDBColumn )
      then isEnable := gridDBColumn.Options.Editing
    else isEnable := ( Component AS TControl ).Enabled;

    DBProcedureResult( 'OMS_USERFORM_Insert', [ GetParentForm( Component ).ClassName ], FormGUID );
    DBProcedureResult( 'OMS_USERCOMPONENT_Insert',
        [ FormGUID, Component.Name, isVisible, isEnable, LabelRussian, NamePostfix, FrameName ], CompGUID );
    DBProcedureResult( 'OMS_USERCOMPONENTONE_TYPE_Insert', [ Component.ClassName ], CompOneTGUID );

    DBProcedure( 'OMS_USERCOMPONENTONE_Insert', [ CompGUID, Component.Name, CompOneTGUID, FrameName ] );
  except
  end;
end;

//------------------------------------------------------------------------------

procedure TOMSForm.AddComponentGroupAccess( ComponentLBL: TComponent;
    ComponentArray: array of TComponent; const FrameName : WideString = '';
    const NamePostfix : WideString = '' );
var
  CompType, i: Integer;
  LabelRussian: WideString;
  ControlLBL, ControlEDIT : TControl;
  isVisible, isEnable : Boolean;
  FormGUID, CompOneTGUID, CompGUID : Variant;
begin
  try
    ControlLBL := TControl( ComponentLBL );

    LabelRussian := '';
    if ( ControlLBL IS TcxLabel )
      then LabelRussian := ( ControlLBL AS TcxLabel ).Caption
    else if ( ControlLBL IS TOMScxLabel )
      then LabelRussian := ( ControlLBL AS TOMScxLabel ).Caption
    else if ( ControlLBL IS TcxButton )
      then LabelRussian := ( ControlLBL AS TcxButton ).Caption
    else if ( ControlLBL IS TcxDBCheckBox )
      then LabelRussian := ( ControlLBL AS TcxDBCheckBox ).Caption;

    isVisible := ControlLBL.Visible;
    isEnable := ControlLBL.Enabled;

    DBProcedureResult( 'OMS_USERFORM_Insert', [ GetParentForm( ControlLBL ).ClassName ], FormGUID );
    DBProcedureResult( 'OMS_USERCOMPONENT_Insert',
        [ FormGUID, ControlLBL.Name, isVisible, isEnable, LabelRussian, NamePostfix, FrameName ], CompGUID );
    DBProcedureResult( 'OMS_USERCOMPONENTONE_TYPE_Insert', [ ControlLBL.ClassName ], CompOneTGUID );

    DBProcedure( 'OMS_USERCOMPONENTONE_Insert', [ CompGUID, ControlLBL.Name, CompOneTGUID, FrameName ] );

    for i := 0 to High( ComponentArray ) do
    begin
      ControlEDIT := TControl( ComponentArray[ i ] );
      DBProcedureResult( 'OMS_USERCOMPONENTONE_TYPE_Insert', [ ControlEDIT.ClassName ], CompOneTGUID );

      DBProcedure( 'OMS_USERCOMPONENTONE_Insert', [ CompGUID, ControlEDIT.Name, CompOneTGUID, FrameName ] );
    end;
  except
  end;
end;

//------------------------------------------------------------------------------

procedure TOMSForm.InitializeRights;
const
  isEnbTrans = False;
var
  adoq: TADOQuery;
  strComponentName: String;
  strFrameName: String;
  Control: TControl;
  cmpn, cmpnFrame: TComponent;
  isVisible, isEnable: Boolean;
  strHint : WideString;
  i : Integer;
  lastFrameName : String;

begin
  FIsWasFirstLoaded := True;

//  if not {$I FormBaseEnabledForms.inc} then Exit;

  lastFrameName := '-';
  adoq := TADOQuery.Create( Self );
  try
    adoq.Connection := DataForm.adoconnOrders;
    adoq.SQL.Text := 'OMS_USERCOMPONENT_SelectByForm :formName';
    adoq.Parameters.ParamByName( 'formName' ).Value := Self.ClassName;
    if not DataForm.OMSRefreshADOQuerySimple( adoq )
      then Exit;

    adoq.First;
    while not adoq.Eof do begin
      try
        strComponentName := adoq.FieldByName( 'ComponentName' ).AsWideString;
        strFrameName := adoq.FieldByName( 'FrameName' ).AsWideString;
        cmpn := Nil;

        if strFrameName <> '' then
        begin
          if ( lastFrameName <> strFrameName ) then
          begin
            lastFrameName := strFrameName;
            cmpnFrame := FindComponent( strFrameName );
          end;

          if Assigned(cmpnFrame)
            then cmpn := cmpnFrame.FindComponent( strComponentName );
        end
        else cmpn := FindComponent( strComponentName );

        if not Assigned( cmpn ) then
        begin
{$IFDEF DEBUG}
          if DBProcedure( 'OMS_USERCOMPONENTONE_Delete', [ adoq.FieldByName( 'OUCO_GUID' ).AsVariant ] )
            then ShowInformation( 'Был удален компонент: "' +  strComponentName + '", фрейм: "' + strFrameName + '"' );
{$ENDIF}
          adoq.Next;
          Continue;
        end;

        isVisible := (adoq.FieldByName( 'IsVisible' ).AsInteger = 1);
        isEnable := (adoq.FieldByName( 'IsEnable' ).AsInteger = 1);
        strHint := adoq.FieldByName( 'Hint' ).AsWideString;

        if Assigned( cmpn ) then
        begin
          if ( cmpn is TdxBarLargeButton ) then
            with cmpn as TdxBarLargeButton do
            begin
              if isVisible
                then Visible := ivAlways
                else Visible := ivNever;

              Enabled := isEnable;
              Hint := strHint;
            end
          else if ( cmpn is TdxBarButton ) then
            with cmpn as TdxBarButton do
            begin
              if isVisible
                then Visible := ivAlways
                else Visible := ivNever;

              Enabled := isEnable;
              Hint := strHint;
            end
          else if ( cmpn is TcxBarEditItem ) then
            with cmpn as TcxBarEditItem do
            begin
              if isVisible
                then Visible := ivAlways
                else Visible := ivNever;

              Enabled := isEnable;
              Hint := strHint;
            end
          else if (cmpn is TOMScxGridDBTableView) then
            with cmpn as TOMScxGridDBTableView do
            begin
              ( Control as TcxGrid ).Visible := isVisible;

              OptionsData.Editing := isEnable;
              OptionsData.Inserting := isEnable;
              OptionsData.Deleting := isEnable;
              OptionsData.Appending := isEnable;
            end
          else if (cmpn is TOMScxGridDBBandedTableView ) then
            with cmpn as TOMScxGridDBBandedTableView do
            begin
              ( Control as TcxGrid ).Visible := isVisible;

              OptionsData.Editing := isEnable;
              OptionsData.Inserting := isEnable;
              OptionsData.Deleting := isEnable;
              OptionsData.Appending := isEnable;
            end
          else  if ( cmpn is TcxGridDBColumn ) then
            with cmpn as TcxGridDBColumn do
            begin
              Visible := isVisible;
              VisibleForCustomization := isVisible;

              Options.Editing := isEnable;
              HeaderHint := strHint;
            end
          else // если визуальный контрол
          begin
            Control := cmpn as TControl;
            if Assigned( Control ) then
            begin
              if (Control is TTabSheet) then
                with (Control as TTabSheet) do begin
                  TabVisible := isVisible;
                  Enabled := True;
              end
              else if Control is TcxTabSheet then
                with (Control as TcxTabSheet ) do begin
                  TabVisible := isVisible;
                  Enabled := True;
              end
              else begin
                Control.Visible := isVisible;
                Control.Enabled := isEnable;
              end;

              Control.Hint := strHint;
            end; // if Assigned( Control ) then
          end; // if Assigned( cmpn ) then
        end;
      except
      end;
      adoq.Next;
    end;
  finally
    adoq.Free;
  end;

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
