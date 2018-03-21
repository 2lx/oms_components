unit uLocalization;

interface

procedure InitializeLocale;

implementation

uses dxCore,
    cxGridStrs, cxGridPopupMenuConsts,
    dxBarStrs,
    cxEditConsts{OK}, cxExtEditConsts, cxLibraryStrs,
    cxFilterConsts{OK}, cxFilterControlStrs{OK}, cxDataConsts,
    cxSchedulerStrs{OK};

procedure InitializeLocale;
begin
  // Quantum Grid
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, '�������� �����, ����� ��������\������\���������� �������');
  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, '�����' );
  cxSetResourceString(@scxGridCustomizationFormCaption, '���������' );
  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, '������' );
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, '������� ������?' );
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, '������� ��� ���������� ������?' );
  cxSetResourceString(@scxGridFilterApplyButtonCaption, '��������� ������' );
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, '���������...' );
  cxSetResourceString(@scxGridFilterIsEmpty, '<������ ����>' );
  cxSetResourceString(@scxGridFilterRowInfoText, '������ ��� �������� ��������' );
  cxSetResourceString(@scxGridGroupByBoxCaption, '���������� ��������� ������� �� ��� ����...');
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask, '������: [RecordIndex]/[RecordCount]' );
  cxSetResourceString(@scxGridLockedStateImageText, '����������, �����...' );
  cxSetResourceString(@scxGridNewItemRowInfoText, '������ ��� ���������� ������' );
  cxSetResourceString(@scxGridNoDataInfoText, '��� ������ ��� �����������' );
  cxSetResourceString(@scxGridRecursiveLevels, '�� �� ������ ������� ����������� ������' );
  cxSetResourceString(@scxImportErrorCaption, '������ �������' );

  cxSetResourceString(@scxGridInplaceEditFormButtonCancel, '������' );
  cxSetResourceString(@scxGridInplaceEditFormButtonUpdate, '��������' );
  cxSetResourceString(@scxGridInplaceEditFormSaveChangesQuery, '������ ���� ��������. �� ������ ��������� ���������?' );
{
  scxGridYesterday = 'Yesterday';
  scxGridToday = 'Today';
  scxGridTomorrow = 'Tomorrow';
  scxGridLast30Days = 'Last 30 days';
  scxGridLast14Days = 'Last 14 days';
  scxGridLast7Days = 'Last 7 days';
  scxGridNext7Days = 'Next 7 days';
  scxGridNext14Days = 'Next 14 days';
  scxGridNext30Days = 'Next 30 days';
  scxGridLastTwoWeeks = 'Last two weeks';
  scxGridLastWeek = 'Last week';
  scxGridThisWeek = 'This week';
  scxGridNextWeek = 'Next week';
  scxGridNextTwoWeeks = 'Next two weeks';
  scxGridLastMonth = 'Last month';
  scxGridThisMonth = 'This month';
  scxGridNextMonth = 'Next month';
  scxGridLastYear = 'Last year';
  scxGridThisYear = 'This year';
  scxGridNextYear = 'Next year';
  scxGridPast = 'Past';
  scxGridFuture = 'Future';

  scxGridMonthFormat = 'mmmm yyyy';
  scxGridYearFormat = 'yyyy';
}
  // ExpressBars
  cxSetResourceString(@dxSBAR_SHOWBELOWRIBBON, '���������� ������ �������� ������� ���� ����' );
  cxSetResourceString(@dxSBAR_SHOWABOVERIBBON, '���������� ������ �������� ������� ���� ����' );
  cxSetResourceString(@dxSBAR_MINIMIZERIBBON, '�������� ���' );
  cxSetResourceString(@dxSBAR_MORECOMMANDS, '��� �������...' );
  cxSetResourceString(@dxSBAR_ADDTOQAT, '�������� � ������ �������� �������' );
  cxSetResourceString(@dxSBAR_ADDTOQATITEMNAME, '�������� %s � ������ �������� �������' );
  cxSetResourceString(@dxSBAR_REMOVEFROMQAT, '������� �� ������� �������� �������' );
  cxSetResourceString(@dxSBAR_CUSTOMIZEQAT, '��������� ������ �������� �������' );

  cxSetResourceString(@dxSBAR_CAPTION, '���������' );
  cxSetResourceString(@dxSBAR_CLOSE, '�������' );
  cxSetResourceString(@dxSBAR_WANTTODELETETOOLBAR, '�� �������, ��� ������ ������� %s ������?' );
  // ...

  //------------------------------------------------------------------------------------------------
  // cxFilterControlStrs
  cxSetResourceString(@cxSFilterBoolOperatorAnd , '�' );
  cxSetResourceString(@cxSFilterBoolOperatorOr , '���' );
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd , '� ��' );
  cxSetResourceString(@cxSFilterBoolOperatorNotOr , '��� ��' );
  //
  cxSetResourceString(@cxSFilterRootButtonCaption , '������' );
  cxSetResourceString(@cxSFilterAddCondition , '�������� &�������' );
  cxSetResourceString(@cxSFilterAddGroup , '�������� &������' );
  cxSetResourceString(@cxSFilterRemoveRow , '&������� ������' );
  cxSetResourceString(@cxSFilterClearAll , '�������� &��' );
  cxSetResourceString(@cxSFilterFooterAddCondition , '������� ������, ����� �������� ����� �������' );

  cxSetResourceString(@cxSFilterGroupCaption , '��������� �������' );
  cxSetResourceString(@cxSFilterRootGroupCaption , '<������>' );
  cxSetResourceString(@cxSFilterControlNullString , '<�����>' );

  cxSetResourceString(@cxSFilterErrorBuilding , '�� ���� ��������� ������ �� ��������' );

  //FilterDialog
  cxSetResourceString(@cxSFilterDialogCaption , '��������� �������' );
  cxSetResourceString(@cxSFilterDialogInvalidValue , '�������� ��������' );
  cxSetResourceString(@cxSFilterDialogUse , '�����������' );
  cxSetResourceString(@cxSFilterDialogSingleCharacter , '����� ����������� ����� ������' );
  cxSetResourceString(@cxSFilterDialogCharactersSeries , '����� ����������� ����� ������ ��������' );
  cxSetResourceString(@cxSFilterDialogOperationAnd , '�' );
  cxSetResourceString(@cxSFilterDialogOperationOr , '���' );
  cxSetResourceString(@cxSFilterDialogRows , '�������� ������, � �������:' );

{  // FilterControlDialog
  cxSFilterControlDialogCaption = 'Filter builder';
  cxSFilterControlDialogNewFile = 'untitled.flt';
  cxSFilterControlDialogOpenDialogCaption = 'Open an existing filter';
  cxSFilterControlDialogSaveDialogCaption = 'Save the active filter to file';
  cxSFilterControlDialogActionSaveCaption = '&Save As...';
  cxSFilterControlDialogActionSaveHint = 'Save As|Saves the active filter with a new name';
  cxSFilterControlDialogActionOpenCaption = '&Open...';
  cxSFilterControlDialogActionOpenHint = 'Open|Opens an existing filter';
  cxSFilterControlDialogActionApplyCaption = '&Apply';
  cxSFilterControlDialogActionOkCaption = 'OK';
  cxSFilterControlDialogActionCancelCaption = 'Cancel';
  cxSFilterControlDialogFileExt = 'flt';
  cxSFilterControlDialogFileFilter = 'Filters (*.flt)|*.flt';
  }

  //------------------------------------------------------------------------------------------------
  // cxFilterConsts
  cxSetResourceString(@cxSFilterOperatorEqual , '����� �������������' );
  cxSetResourceString(@cxSFilterOperatorNotEqual , '�� �������������' );
  cxSetResourceString(@cxSFilterOperatorLess , '������ ���' );
  cxSetResourceString(@cxSFilterOperatorLessEqual , '������ ��� ����� ���' );
  cxSetResourceString(@cxSFilterOperatorGreater , '������ ���' );
  cxSetResourceString(@cxSFilterOperatorGreaterEqual , '������ ��� ����� ���' );
  cxSetResourceString(@cxSFilterOperatorLike , '������ (��������� ���������� ��� ���������)' );
  cxSetResourceString(@cxSFilterOperatorNotLike , '�� ������ (�� �������� ���������)' );
  cxSetResourceString(@cxSFilterOperatorBetween , '�����' );
  cxSetResourceString(@cxSFilterOperatorNotBetween , '�� �����' );
  cxSetResourceString(@cxSFilterOperatorInList , '� ������' );
  cxSetResourceString(@cxSFilterOperatorNotInList , '�� � ������' );

  cxSetResourceString(@cxSFilterOperatorYesterday , '= �����' );
  cxSetResourceString(@cxSFilterOperatorToday , '= �������' );
  cxSetResourceString(@cxSFilterOperatorTomorrow , '= ������' );

  cxSetResourceString(@cxSFilterOperatorLast7Days , '��������� 7 ����' );
  cxSetResourceString(@cxSFilterOperatorLastWeek , '��������� ������' );
  cxSetResourceString(@cxSFilterOperatorLast14Days , '��������� 14 ����' );
  cxSetResourceString(@cxSFilterOperatorLastTwoWeeks , '��������� 2 ������' );
  cxSetResourceString(@cxSFilterOperatorLast30Days , '��������� 30 ����' );
  cxSetResourceString(@cxSFilterOperatorLastMonth , '��������� �����' );
  cxSetResourceString(@cxSFilterOperatorLastYear , '��������� ���' );
  cxSetResourceString(@cxSFilterOperatorPast , '�� �������� �������' );

  cxSetResourceString(@cxSFilterOperatorThisWeek , '�� ���� ������' );
  cxSetResourceString(@cxSFilterOperatorThisMonth , '� ���� ������' );
  cxSetResourceString(@cxSFilterOperatorThisYear , '� ���� ����' );

  cxSetResourceString(@cxSFilterOperatorNext7Days , '� �������� 7 ����' );
  cxSetResourceString(@cxSFilterOperatorNextWeek , '� ��������� ������' );
  cxSetResourceString(@cxSFilterOperatorNext14Days , '� ��������� 14 ����' );
  cxSetResourceString(@cxSFilterOperatorNextTwoWeeks , '� ��������� 2 ������' );
  cxSetResourceString(@cxSFilterOperatorNext30Days , '� ��������� 30 ����' );
  cxSetResourceString(@cxSFilterOperatorNextMonth , '� ��������� �����' );
  cxSetResourceString(@cxSFilterOperatorNextYear , '� ��������� ���' );
  cxSetResourceString(@cxSFilterOperatorFuture , '� �������' );

  cxSetResourceString(@cxSFilterAndCaption , '�' );
  cxSetResourceString(@cxSFilterOrCaption , '���' );
  cxSetResourceString(@cxSFilterNotCaption , '��' );
  cxSetResourceString(@cxSFilterBlankCaption , '�����' );

  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull , '= �����' );
  cxSetResourceString(@cxSFilterOperatorIsNotNull , '!= �����' );
  cxSetResourceString(@cxSFilterOperatorBeginsWith , '���������� �' );
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith , '�� ���������� �' );
  cxSetResourceString(@cxSFilterOperatorEndsWith , '������������� ��' );
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith , '�� ������������� ��' );
  cxSetResourceString(@cxSFilterOperatorContains , '��������' );
  cxSetResourceString(@cxSFilterOperatorDoesNotContain , '�� ��������' );
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption , '(���)' );
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(���������...)' );
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(������)' );
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(�� ������)' );

  //------------------------------------------------------------------------------------------------
  // Editors
  cxSetResourceString(@cxSEditButtonCancel, '������' );
  cxSetResourceString(@cxSEditButtonOK , 'OK' );
  cxSetResourceString(@cxSEditDateConvertError , '���������� ��������������� � ������ ����' );
  cxSetResourceString(@cxSEditInvalidRepositoryItem , '���������� ��������� RepositoryItem' );
  cxSetResourceString(@cxSEditNumericValueConvertError , '���������� ��������������� � ������ �����' );
  cxSetResourceString(@cxSEditPopupCircularReferencingError , '��������� ������ ��������' );
  cxSetResourceString(@cxSEditPostError , '��������� ������ ��� ���������� ��������' );
  cxSetResourceString(@cxSEditTimeConvertError , '���������� ��������������� � ������ �������' );
  cxSetResourceString(@cxSEditValidateErrorText , '�������� ������� ������. ������� ESC ������� ����� �������� ���������' );
  cxSetResourceString(@cxSEditValueOutOfBounds , '�������� ����� �� ���������� �������' );

  cxSetResourceString(@cxSEditCheckBoxChecked             , '������' );
  cxSetResourceString(@cxSEditCheckBoxGrayed              , '' );
  cxSetResourceString(@cxSEditCheckBoxUnchecked           , '����' );
  cxSetResourceString(@cxSRadioGroupDefaultCaption        , '' );

  cxSetResourceString(@cxSTextTrue                        , '������' );
  cxSetResourceString(@cxSTextFalse                       , '����' );

  // Blob
  cxSetResourceString(@cxSBlobButtonOK                    , '&OK' );
  cxSetResourceString(@cxSBlobButtonCancel                , '&������' );
  cxSetResourceString(@cxSBlobButtonClose                 , '&�������' );
  cxSetResourceString(@cxSBlobMemo                        , '(MEMO)' );
  cxSetResourceString(@cxSBlobMemoEmpty                   , '(memo)' );
  cxSetResourceString(@cxSBlobPicture                     , '(�����������)' );
  cxSetResourceString(@cxSBlobPictureEmpty                , '(�����������)' );

  // popup menu items
  cxSetResourceString(@cxSMenuItemCaptionCut              , '��&������' );
  cxSetResourceString(@cxSMenuItemCaptionCopy             , '&����������' );
  cxSetResourceString(@cxSMenuItemCaptionPaste            , '&��������' );
  cxSetResourceString(@cxSMenuItemCaptionDelete           , '&�������' );
  cxSetResourceString(@cxSMenuItemCaptionLoad             , '&���������...' );
  cxSetResourceString(@cxSMenuItemCaptionSave             , '��������� &���...' );
  cxSetResourceString(@cxSMenuItemCaptionAssignFromWebCam , '�������� �� ���-��&����...' );

  // Date
  cxSetResourceString(@cxSDatePopupClear                  , '��������' );
  cxSetResourceString(@cxSDatePopupNow                    , '������' );
  cxSetResourceString(@cxSDatePopupOK                     , 'OK' );
  cxSetResourceString(@cxSDatePopupToday                  , '�������' );
  cxSetResourceString(@cxSDatePopupCancel                 , '������' );
  cxSetResourceString(@cxSDateError                       , '�������� ����' );

  // Calculator
  cxSetResourceString(@scxSCalcError                      , '������' );

  // HyperLink
  cxSetResourceString(@scxSHyperLinkPrefix                , 'http://' );
  cxSetResourceString(@scxSHyperLinkDoubleSlash           , '//' );

  // Navigator
  cxSetResourceString(@cxNavigatorHint_First              , '� ������ ������' );
  cxSetResourceString(@cxNavigatorHint_Prior              , '� ���������� ������' );
  cxSetResourceString(@cxNavigatorHint_PriorPage          , '� ���������� ��������' );
  cxSetResourceString(@cxNavigatorHint_Next               , '� ��������� ������' );
  cxSetResourceString(@cxNavigatorHint_NextPage           , '� ��������� ��������' );
  cxSetResourceString(@cxNavigatorHint_Last               , '� ��������� ������' );
  cxSetResourceString(@cxNavigatorHint_Insert             , '�������� ����� ������' );
  cxSetResourceString(@cxNavigatorHint_Append             , '�������� ������ � ����� �������' );
  cxSetResourceString(@cxNavigatorHint_Delete             , '������� ������ ��� ��������' );
  cxSetResourceString(@cxNavigatorHint_Edit               , '������������� ������' );
  cxSetResourceString(@cxNavigatorHint_Post               , '��������� ��������� ������ ������' );
  cxSetResourceString(@cxNavigatorHint_Cancel             , '�������� ��������� ������ ������' );
  cxSetResourceString(@cxNavigatorHint_Refresh            , '�������� ������' );
  cxSetResourceString(@cxNavigatorHint_SaveBookmark       , '��������� ��������' );
  cxSetResourceString(@cxNavigatorHint_GotoBookmark       , '����� ��������' );
  cxSetResourceString(@cxNavigatorHint_Filter             , '������' );
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion   , '������� ������?' );
  cxSetResourceString(@cxNavigatorInfoPanelDefaultDisplayMask , '������: [RecordIndex]/[RecordCount]' );
{
  // BreadcrumbEdit
  sdxBreadcrumbEditInvalidPath = 'Cannot find "%s". Check the spelling and try again.';
  sdxBreadcrumbEditInvalidStreamVersion = 'Invalid data version: %d';

  // Edit Repository
  scxSEditRepositoryBlobItem         = 'BlobEdit|Represents the BLOB editor';
  scxSEditRepositoryButtonItem       = 'ButtonEdit|Represents an edit control with embedded buttons';
  scxSEditRepositoryCalcItem         = 'CalcEdit|Represents an edit control with a dropdown calculator window';
  scxSEditRepositoryCheckBoxItem     = 'CheckBox|Represents a check box control that allows selecting an option';
  scxSEditRepositoryComboBoxItem     = 'ComboBox|Represents the combo box editor';
  scxSEditRepositoryCurrencyItem     = 'CurrencyEdit|Represents an editor enabling editing currency data';
  scxSEditRepositoryDateItem         = 'DateEdit|Represents an edit control with a dropdown calendar';
  scxSEditRepositoryHyperLinkItem    = 'HyperLink|Represents a text editor with hyperlink functionality';
  scxSEditRepositoryImageComboBoxItem = 'ImageComboBox|Represents an editor displaying the list of images and text strings within the dropdown window';
  scxSEditRepositoryImageItem        = 'Image|Represents an image editor';
  scxSEditRepositoryLookupComboBoxItem = 'LookupComboBox|Represents a lookup combo box control';
  scxSEditRepositoryMaskItem         = 'MaskEdit|Represents a generic masked edit control.';
  scxSEditRepositoryMemoItem         = 'Memo|Represents an edit control that allows editing memo data';
  scxSEditRepositoryMRUItem          = 'MRUEdit|Represents a text editor displaying the list of most recently used items (MRU) within a dropdown window';
  scxSEditRepositoryPopupItem        = 'PopupEdit|Represents an edit control with a dropdown list';
  scxSEditRepositorySpinItem         = 'SpinEdit|Represents a spin editor';
  scxSEditRepositoryRadioGroupItem   = 'RadioGroup|Represents a group of radio buttons';
  scxSEditRepositoryTextItem         = 'TextEdit|Represents a single line text editor';
  scxSEditRepositoryTimeItem         = 'TimeEdit|Represents an editor displaying time values';
  scxSEditRepositoryToggleSwitchItem = 'ToggleSwitch|Represents a toggle switch editor that allows selecting an option';
  scxSEditRepositoryDateTimeWheelPickerItem = 'DateTimeWheelPicker|Represents an edit control that allows the selection of a date-time value using a wheel picker';
  scxSEditRepositorySparklineItem    = 'Sparkline|Represents a sparkline editor';
  scxSEditRepositoryLookupSparklineItem = 'LookupSparkline|Represents a lookup sparkline editor';

  // Regular Expressions
  scxRegExprLine = 'Line';
  scxRegExprChar = 'Char';
  scxRegExprNotAssignedSourceStream = 'The source stream is not assigned';
  scxRegExprEmptySourceStream = 'The source stream is empty';
  scxRegExprCantUsePlusQuantifier = 'The ''+'' quantifier cannot be applied here';
  scxRegExprCantUseStarQuantifier = 'The ''*'' quantifier cannot be applied here';
  scxRegExprCantCreateEmptyAlt = 'The alternative should not be empty';
  scxRegExprCantCreateEmptyBlock = 'The block should not be empty';
  scxRegExprIllegalSymbol = 'Illegal ''%s''';
  scxRegExprIllegalQuantifier = 'Illegal quantifier ''%s''';
  scxRegExprNotSupportQuantifier = 'The parameter quantifiers are not supported';
  scxRegExprIllegalIntegerValue = 'Illegal integer value';
  scxRegExprTooBigReferenceNumber = 'Too big reference number';
  scxRegExprCantCreateEmptyEnum = 'Can''t create empty enumeration';
  scxRegExprSubrangeOrder = 'The starting character of the subrange must be less than the finishing one';
  scxRegExprHexNumberExpected0 = 'Hexadecimal number expected';
  scxRegExprHexNumberExpected = 'Hexadecimal number expected but ''%s'' found';
  scxRegExprMissing = 'Missing ''%s''';
  scxRegExprUnnecessary = 'Unnecessary ''%s''';
  scxRegExprIncorrectSpace = 'The space character is not allowed after ''\''';
  scxRegExprNotCompiled = 'Regular expression is not compiled';
  scxRegExprIncorrectParameterQuantifier = 'Incorrect parameter quantifier';
  scxRegExprCantUseParameterQuantifier = 'The parameter quantifier cannot be applied here';

  // MaskEdit
  scxMaskEditRegExprError = 'Regular expression errors:';
  scxMaskEditInvalidEditValue = 'The edit value is invalid';
  scxMaskEditNoMask = 'None';
  scxMaskEditIllegalFileFormat = 'Illegal file format';
  scxMaskEditEmptyMaskCollectionFile = 'The mask collection file is empty';
  scxMaskEditMaskCollectionFiles = 'Mask collection files';
  cxSSpinEditInvalidNumericValue = 'Invalid numeric value';

  // AlertWindow
  sdxAlertWindowNavigationPanelDefaultDisplayMask = '[MessageIndex] of [MessageCount]';
  sdxAlertWindowPreviousMessage = 'Previous message';
  sdxAlertWindowNextMessage = 'Next message';
  sdxAlertWindowPin = 'Pin';
  sdxAlertWindowClose = 'Close';
  sdxAlertWindowDropdown = 'Show Drop-down Menu';

  // ColorGallery
  sdxColorGalleryThemeColors = 'Theme Colors';
  sdxColorGalleryStandardColors = 'Standard Colors';

  // ColorDialog
  sdxColorDialogAddToCustomColors = '&Add to Custom Colors';
  sdxColorDialogApply = '&OK';
  sdxColorDialogCancel = '&Cancel';
  sdxColorDialogDefineCustomColor = '&Define Custom Colors >>';
  sdxColorDialogBasicColors = 'Basic Colors';
  sdxColorDialogCaption = 'Color Editor';
  sdxColorDialogCustomColors = 'Custom Colors';

  // ColorPicker
  sdxColorPickerAlphaLabel = 'A:';
  sdxColorPickerBlueLabel = 'B:';
  sdxColorPickerGreenLabel = 'G:';
  sdxColorPickerHexCodeLabel = '#';
  sdxColorPickerHueLabel = 'H:';
  sdxColorPickerLightnessLabel = 'L:';
  sdxColorPickerRedLabel = 'R:';
  sdxColorPickerSaturationLabel = 'S:';

  // ShellBrowser
  scxShellBrowserDlgCaption = 'Browse for Folder';
  scxShellBrowserDlgCurrentFolderCaption = 'Current Folder';

  // CameraControl
  sdxCameraDialogAssign = '&Assign';
  sdxCameraDialogCancel = '&Cancel';
  sdxCameraDialogPause = '&Pause';
  sdxCameraDialogPlay = '&Play';
  sdxCameraDialogCaption = 'Camera Preview';
  sdxCameraInactive = 'Inactive';
  sdxCameraRunning = 'Running';
  sdxCameraPaused = 'Paused';
  sdxCameraNotDetected = 'No camera detected';
  sdxCameraInitializing = 'Initializing...';
  sdxCameraIsBusy = 'Camera is inaccessible.'#13#10'Try closing other programs that might be using your camera';

  // ToggleSwitch
  sdxDefaultToggleSwitchOffText = 'Off';
  sdxDefaultToggleSwitchOnText = 'On';

  // DateTimeWheelPicker
  sdxDateTimeWheelPickerHours = 'Hours';
  sdxDateTimeWheelPickerMinutes = 'Minutes';
  sdxDateTimeWheelPickerSeconds = 'Seconds';

  // Sparkline
  sdxSparklineNoData = '<No data>';
            }

  //------------------------------------------------------------------------------------------------
  // cxSchedulerStrs
  cxSetResourceString(@scxUntitledEvent , '���������� �������' );

  cxSetResourceString(@scxVertical   , '������������' );
  cxSetResourceString(@scxHorizontal , '��������������' );
  cxSetResourceString(@scxTimeGrid   , '��������� �����' );

  cxSetResourceString(@scxMinute  , '������' );
  cxSetResourceString(@scxMinutes , '������' );
  cxSetResourceString(@scxHour    , '���' );
  cxSetResourceString(@scxHours   , '����' );
  cxSetResourceString(@scxOneDay  , '���� ����' );

  // Navigation buttons
  cxSetResourceString(@scxNextAppointment , '��������� �������' );
  cxSetResourceString(@scxPrevAppointment , '���������� �������' );

  // dialogs constants
  cxSetResourceString(@scxDeleteRecurringEventDescription , '��� ������������� �������. �� ������ ������� ������ ������� ������� ��� ��� �����?' );
  cxSetResourceString(@scxEditRecurringEventDescription   , '��� ������������� �������. �� ������ ������� ������ ������� ������� ��� ��� �����?' );

  cxSetResourceString(@scxGoToDateDialogCaption     , '���� �� �������' );
  cxSetResourceString(@scxDeleteTypeDialogCaption   , '������������� ��������' );
  cxSetResourceString(@scxDeleteTypeOccurrenceLabel , '������� ��� �������' );
  cxSetResourceString(@scxDeleteTypeSeriesLabel     , '������� ��� �����' );
  cxSetResourceString(@scxEditTypeDialogCaption     , '������� ������������� �������' );
  cxSetResourceString(@scxEditTypeOccurrenceLabel   , '������� ��������� �������' );
  cxSetResourceString(@scxEditTypeSeriesLabel       , '������� ����� �������' );

  cxSetResourceString(@scxExitConfirmation  , '�� ������ ��������� ���������?' );
  cxSetResourceString(@scxDeleteConfirmation, '������ ����������. �� ������� ��� ������ ������� ��?' );
  cxSetResourceString(@scxWrongTimeBounds   , '��������� ���� ���� ��������� ������ ��� ���� ������.' );
  cxSetResourceString(@scxWrongPattern      , '������������� ������ �� ������.' );
  cxSetResourceString(@scxReplaceOccurrenceDate , '��������� ������ ����� ����� %s ����. ��� ���� ������� ������� ������� �� ��������� ���� ������.' );
  cxSetResourceString(@scxInvalidRecurrenceDuration , '����������������� ������� ������ ���� ������ ��� ��� �����������. ' +
    '��������� �����������������, ��� �������� ������ ������������� � ���������� ���� ��������� �������.' );
  cxSetResourceString(@scxConfirmLostExceptions , '����� ����������� ��������� � ���� ������������� �������� ����� ��������. ��� OK?' );
  cxSetResourceString(@scxInvalidNumber      , '�� ������ ������ ������ �����.' );
  cxSetResourceString(@scxShedulerEditorFormNotRegistered , '�� ������� ������������������ ���� ��� ��������������.' );
  cxSetResourceString(@scxNoAvailableFreeTime , '�� ���������� ���������� �������.' );
  cxSetResourceString(@scxCannotRescheduleOccurrence , 'Cannot reschedule an occurrence of the recurring appointment "%s" if it skips over a later occurrence of the same appointment.' );
  cxSetResourceString(@scxTwoOccurrencesPerDay , '��� ������� "%s" �� ����� ��������� � ���� ����.' );

  cxSetResourceString(@scxEvent             , '�������' );
  cxSetResourceString(@scxUntitled          , '����������' );

  cxSetResourceString(@scxNoneEvent         , '������� �������' );
  cxSetResourceString(@scxRecurrenceEvent   , '������������� �������' );
  cxSetResourceString(@scxExceptionEvent    , '�������������� �������' );
  cxSetResourceString(@scxOccurenceEvent    , '��������� �������' );

  cxSetResourceString(@scxAdd               , '&��������' );
  cxSetResourceString(@scxEdit              , '&�������������' );
  cxSetResourceString(@scxDelete            , '&�������' );
  cxSetResourceString(@scxRecurrence        , '&�������������' );
  cxSetResourceString(@scxActionRecurrence  , '�������������' );

  cxSetResourceString(@scxDate              , '&����:' );
  cxSetResourceString(@scxShowIn            , '&�������� �:' );
  cxSetResourceString(@scxDayCalendar       , '�������� �� ����' );
  cxSetResourceString(@scxWeekCalendar      , '��������� �� �������' );
  cxSetResourceString(@scxMonthCalendar     , '��������� �� �������' );
  cxSetResourceString(@scxWorkWeekCalendar  , '��������� �� ������� �������' );

  cxSetResourceString(@scxEventsConflict    , '�������� � ������ �������� � ����� ����������.' );
  cxSetResourceString(@scxResource          , '������' );
  cxSetResourceString(@scxSubject           , '&�������:' );
  cxSetResourceString(@scxLocation          , '&���������������:' );
  cxSetResourceString(@scxLabelAs           , '����� ���:' );
  cxSetResourceString(@scxLabel             , '��&���:' );
  cxSetResourceString(@scxStartTime         , '����� &������:' );
  cxSetResourceString(@scxEndTime           , '����� &�����:' );
  cxSetResourceString(@scxAllDayEvent       , '&������� � ������� ���' );
  cxSetResourceString(@scxRecurrenceLabel   , '�������������:' );

  cxSetResourceString(@scxReminder          , '����������:' );
  cxSetResourceString(@scxShowTimeAs        , '�������� ����� ���:' );
  cxSetResourceString(@scxShowAs            , '�������� ���:' );
{
  scxSuffixMinute      = 'minute';
  scxSuffixMinutes     = 'minutes';
  scxSuffixHour        = 'hour';
  scxSuffixHours       = 'hours';
  scxSuffixDay         = 'day';
  scxSuffixDays        = 'days';
  scxSuffixWeek        = 'week';
  scxSuffixWeeks       = 'weeks';

  scxBusy              = 'Busy';
  scxFree              = 'Free';
  scxTentative         = 'Tentative';
  scxOutOfOffice       = 'Out of office';

  scxRecurrenceCaption         = 'Event recurrence';
  scxRecurrenceHolidayCaption  = 'Holiday recurrence';

  scxEventTime         = ' Event time ';
  scxRecurrencePattern = ' Recurrence pattern ';
  scxRangeOfRecurrence = ' Range of recurrence ';
  scxStart             = '&Start:';
  scxStart1            = 'S&tart:';
  scxEnd               = '&End:';
  scxDuration          = 'D&uration:';
  // Pattern
  scxDaily             = '&Daily';
  scxWeekly            = '&Weekly';
  scxQuarterly         = '&Quarterly';
  scxMonthly           = '&Monthly';
  scxYearly            = '&Yearly';
  // daily
  scxEvery             = 'E&very';
  scxEveryWeekDay      = 'Every wee&kday';
  scxDays              = 'day(s)';
  // weekly
  scxWeeksOn           = 'week(s) on:';
  scxRecurEvery        = 'Rec&ur every';
  //monthly
  scxOfEvery           = 'of every';
  scxMonths            = 'month(s)';
  // yearly
  scxThe               = 'T&he';
  scxOf                = 'of';

  // Task links

  scxTaskComplete                   = 'Task co&mplete:';
  scxTaskStatus                     = 'Task status';
  scxTaskDependencyEditorCaption    = 'Task Dependency';
  scxTaskWrongTimeBounds            = 'A new date must be entered within the period of %s - %s.';
  scxFinishToFinishLong   = 'Finish-to-Finish (FF)';
  scxFinishToStartLong    = 'Finish-to-Start (FS)';
  scxFrom                 = 'From:';
  scxStartToFinishLong    = 'Start-to-Finish (SF)';
  scxStartToStartLong     = 'Start-to-Start (SS)';
  scxTo                   = 'To:';
  scxType                 = '&Type:';

  // other
  scxFirst             = 'first';
  scxSecond            = 'second';
  scxThird             = 'third';
  scxFourth            = 'fourth';
  scxLast              = 'last';
  scxDay               = 'D&ay';
  scxDay1              = 'day';
  scxWeekday           = 'weekday';
  scxWeekendday        = 'weekend day';
  scxNoEndDate         = '&No end date';
  scxEndAfter          = 'End a&fter:';
  scxEndBy             = 'End &by:';
  scxOccurences        = 'occurrences';

  // buttons
  scxAdd1              = 'Add';
  scxAdd1Hint          = 'Add (Ins)';
  scxEditDotted        = 'Edit...';
  scxApply             = '&Apply';
  scxFindAvailableTime = 'Find available time';
  scxOk                = '&OK';
  scxSaveAndClose      = 'Save && Close';
  scxSaveAndCloseHint  = 'Save & Close';
  scxSave              = 'Save';
  scxCancel            = '&Cancel';
  scxClose             = '&Close';
  scxActionClose       = 'Close';
  scxDown              = '&Down';
  scxDelete1           = 'Delete';
  scxDelete1Hint       = 'Delete (Del)';
  scxEdit1             = 'Edit';
  scxImport            = '&Import';
  scxExport            = '&Export';
  scxImportHint        = 'Import';
  scxExportHint        = 'Export';
  scxRemoveRecur       = '&Remove recurrence';
  scxSelectAll         = 'Select &all';
  scxSelectNone        = 'Select &none';
  scxUp                = '&Up';
  //
  scxResourceLayoutCaption = 'Resources layout editor';

  // popup menu resources
  scxpmNewEvent          = '&New Event';
  scxpmNewAllDayEvent    = 'New All Day &Event';
  scxpmNewRecurringEvent = 'New &Recurring Event';
  scxpmToday             = 'T&oday';
  scxpmGotoThisDay       = 'Go to This &Day';
  scxpmGoToDate          = 'Go &to Date...';
  scxpmResourcesLayout   = 'Resources layout editor...';

  // for event
  scxpmOpen              = '&Open';
  scxpmEditSeries        = 'Edit Se&ries';
  scxpmShowTimeAs        = 'S&how Time As';
  scxpmDelete            = '&Delete';
  scxpmFree              = '&Free';
  scxpmTentative         = '&Tentative';
  scxpmBusy              = '&Busy';
  scxpmOutOfOffice       = '&Out of Office';
  scxpmLabel             = '&Label';

  // event label captions
  scxEventLabelNone      = 'None';
  scxEventLabel0         = 'Important';
  scxEventLabel1         = 'Business';
  scxEventLabel2         = 'Personal';
  scxEventLabel3         = 'Vacation';
  scxEventLabel4         = 'Must Attend';
  scxEventLabel5         = 'Travel Required';
  scxEventLabel6         = 'Needs Preparation';
  scxEventLabel7         = 'Birthday';
  scxEventLabel8         = 'Anniversary';
  scxEventLabel9         = 'Phone Call';

  // for time ruler menu items
  scxpmTimeZone          = 'Chan&ge Time Zone';
  scxpm60Minutes         = '6&0 Minutes';
  scxpm30Minutes         = '&30 Minutes';
  scxpm15Minutes         = '&15 Minutes';
  scxpm10Minutes         = '10 &Minutes';
  scxpm6Minutes          = '&6 Minutes';
  scxpm5Minutes          = '&5 Minutes';

  // for year view scale menu items
  scxpmFullYear          = '&Full Year';
  scxpmHalfYear          = '&Half-Year';
  scxpmQuarter           = '&Quarter';

  // year view scales
  scxFullYear            = 'Full Year';
  scxHalfYear            = 'Half-Year';
  scxQuarter             = 'Quarter';
  scxHalfYearShort       = 'H';
  scxQuarterShort        = 'Q';

  //navigator hints
  scxFirstButtonHint     = 'First Resource';
  scxPrevPageButtonHint  = 'Previous Page';
  scxPrevButtonHint      = 'Previous Resource';
  scxNextButtonHint      = 'Next Resource';
  scxNextPageButtonHint  = 'Next Page';
  scxLastButtonHint      = 'Last Resource';
  scxShowMoreResourcesButtonHint  = 'Show More Resources';
  scxShowFewerResourcesButtonHint = 'Show Fewer Resources';

  //for reminder
  scxrCaptionReminder  = '1 Reminder';
  scxrCaptionReminders = '%d Reminders';
  scxrDismissButton    = '&Dismiss';
  scxrDismissAllButton = 'Dismiss &All';
  scxrDueIn            = 'Due in';
  scxrOpenItemButton   = '&Open Item';
  scxrSnoozeButton     = '&Snooze';
  scxrSubject          = 'Subject';
  scxrSnoozeLabel      = '&Snooze';
  scxrSelected         = '%d reminders are selected';
  scxrStartTime        = 'Start time: %s';

  // time
  scxTime0m     = '0 minutes';
  scxTime5m     = '5 minutes';
  scxTime10m    = '10 minutes';
  scxTime15m    = '15 minutes';
  scxTime20m    = '20 minutes';
  scxTime30m    = '30 minutes';
  scxTime1h     = '1 hour';
  scxTime2h     = '2 hours';
  scxTime3h     = '3 hours';
  scxTime4h     = '4 hours';
  scxTime5h     = '5 hours';
  scxTime6h     = '6 hours';
  scxTime7h     = '7 hours';
  scxTime8h     = '8 hours';
  scxTime9h     = '9 hours';
  scxTime10h    = '10 hours';
  scxTime11h    = '11 hours';
  scxTime12h    = '12 hours';
  scxTime18h    = '18 hours';
  scxTime1d     = '1 day';
  scxTime2d     = '2 days';
  scxTime3d     = '3 days';
  scxTime4d     = '4 days';
  scxTime1w     = '1 week';
  scxTime2w     = '2 weeks';
  // advance time
  scxAdvance0h  = '0 hours before start';
  scxAdvance5m  = '5 minutes before start';
  scxAdvance10m = '10 minutes before start';
  scxAdvance15m = '15 minutes before start';

  // for export

  secxSetDateRangeCaption = 'Set Date Range';
  secxSetDateRangeText = 'Export and create individual occurrences of appointments or ' +
    'tasks that occur between:';
  secxSetDateRangeAnd = 'and';
  secxTrue = 'TRUE';
  secxFalse = 'FALSE';
  secxExportStorageInvalid = 'Storage not assigned';

  // card field names

  secxYes         = 'Yes';
  secxNo          = 'No';
  secxSubject     = 'Subject';
  secxLocation    = 'Location';
  secxDescription = 'Description';
  secxAllDay      = 'All day';
  secxStart       = 'Start';
  secxFinish      = 'Finish';
  secxState       = 'State';
  secxReminder    = 'Reminder';

  // table fields

  secxStartDate          = 'StartDate';
  secxStartTime          = 'StartTime';
  secxEndDate            = 'EndDate';
  secxEndTime            = 'EndTime';
  secxAlldayevent        = 'Alldayevent';
  secxReminderonoff      = 'Reminderonoff';
  secxReminderDate       = 'ReminderDate';
  secxReminderTime       = 'ReminderTime';
  secxCategories         = 'Categories';
  secxShowtimeas         = 'Showtimeas';

  // storage
  scxRequiredFieldsNeeded = 'The following required fields'#13#10'%sare not assigned!';
  scxInvalidFieldName = 'Invalid field name';
  scxInvalidCustomField = 'Invalid custom field';

  // Event fields
  scxAllDayEventField = 'All Day Event';
  scxIDField = 'ID';
  scxActualFinishField = 'Actual Finish';
  scxActualStartField = 'Actual Start';
  scxCaptionField = 'Caption';
  scxEnabledField = 'Enabled';
  scxEventTypeField = 'Type';
  scxFinishField = 'Finish';
  scxLabelField = 'Label';
  scxLocationField = 'Location';
  scxMessageField = 'Message';
  scxParentIDField = 'ParentID';
  scxGroupIDField = 'GroupID';
  scxRecurrenceField = 'Recurrence Pattern';
  scxRecurrenceIndexField = 'Recurrence Index';
  scxReminderDateField = 'ReminderDate';
  scxReminderField = 'Reminder';
  scxReminderMinutesBeforeStartField = 'Reminder Minutes Before Start';
  scxResourceField = 'Resource';
  scxStartField = 'Start';
  scxStateField = 'State';
  scxTaskCompleteField = 'Task Complete';
  scxTaskIndexField = 'Task Index';
  scxTaskLinksField = 'Task Links';
  scxTaskStatusField = 'Task Status';

  // status
  scxNotStarted = 'Not Started';
  scxInProgress = 'In Progress';
  scxComplete   = 'Complete';
  scxWaiting    = 'Waiting';
  scxDeferred   = 'Deferred';

  // Event task relations

  scxFinishToStart  = 'Finish-To-Start';
  scxStartToStart   = 'Start-To-Start';
  scxFinishToFinish = 'Finish-To-Finish';
  scxStartToFinish  = 'Start-To-Finish ';

  scxFinishToStartShort  = 'FS';
  scxStartToStartShort   = 'SS';
  scxFinishToFinishShort = 'FF';
  scxStartToFinishShort  = 'SF';

  scxGanttEventHint = 'Task: %s'#13#10'Complete: %d %%'#13#10'Start: %s'#13#10'Finish: %s';
  scxLinkHint = 'Task Link: %s (%s)'#13#10'From: %s'#13#10'To: %s';

  //

  scxCompleteDisplayFormat = '0 %';

  scxNone      = 'Simple Event';
  scxPattern   = 'Recurrence Pattern';
  scxOccurrence= 'Simple Occurence';
  scxException = 'Exception Occurrence';
  scxCustom    = 'Custom Occurrence';

  // Holidays

  scxHolidaysEditorCaption                = 'Holidays editor';
  scxLocationsGroupBox                    = 'Locations';
  scxHolidaysGroupBox                     = 'Holidays';
  scxAddedHolidaysGroupBox                = 'Added holidays';
  scxLocationName                         = 'Name:';
  scxHolidaysLocationEditorCaption        = 'Location editor';
  scxHolidayName                          = 'Name:';
  scxHolidayDate                          = 'Date:';
  scxHolidaysLocationHolidayEditorCaption = 'Holiday editor';
  scxOutlookFormatMismatch                = 'Holiday format mismatch';
  scxHolidayDisplayFormat                 = '%s (%s)';
  scxAddedHolidayDisplayFormat            = '%s - %s (%s)';  }
end;

end.
