unit uLocalization;

interface

procedure SetupLocalization;

implementation

uses dxCore, cxGridStrs, dxBarStrs, cxEditConsts;

procedure SetupLocalization;
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
end;

end.
