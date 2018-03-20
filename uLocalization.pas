unit uLocalization;

interface

procedure SetupLocalization;

implementation

uses dxCore, cxGridStrs, dxBarStrs, cxEditConsts;

procedure SetupLocalization;
begin
  // Quantum Grid
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, 'Щелкните здесь, чтобы показать\скрыть\перетащить столбцы');
  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Банды' );
  cxSetResourceString(@scxGridCustomizationFormCaption, 'Настройка' );
  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Строки' );
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Удалить запись?' );
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Удалить все выделенные записи?' );
  cxSetResourceString(@scxGridFilterApplyButtonCaption, 'Применить фильтр' );
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Настроить...' );
  cxSetResourceString(@scxGridFilterIsEmpty, '<Фильтр пуст>' );
  cxSetResourceString(@scxGridFilterRowInfoText, 'СТРОКА ДЛЯ УКАЗАНИЯ ФИЛЬТРОВ' );
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Перетащите заголовок столбца на это поле...');
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask, 'Запись: [RecordIndex]/[RecordCount]' );
  cxSetResourceString(@scxGridLockedStateImageText, 'Пожалуйста, ждите...' );
  cxSetResourceString(@scxGridNewItemRowInfoText, 'СТРОКА ДЛЯ ДОБАВЛЕНИЯ ЗАПИСИ' );
  cxSetResourceString(@scxGridNoDataInfoText, 'НЕТ ДАННЫХ ДЛЯ ОТОБРАЖЕНИЯ' );
  cxSetResourceString(@scxGridRecursiveLevels, 'Вы не можете создать рекурсивные уровни' );
  cxSetResourceString(@scxImportErrorCaption, 'Ошибка импорта' );

  cxSetResourceString(@scxGridInplaceEditFormButtonCancel, 'Отмена' );
  cxSetResourceString(@scxGridInplaceEditFormButtonUpdate, 'Обновить' );
  cxSetResourceString(@scxGridInplaceEditFormSaveChangesQuery, 'Данные были изменены. Вы хотите сохранить изменения?' );

  // ExpressBars
  cxSetResourceString(@dxSBAR_SHOWBELOWRIBBON, 'Показывать тулбар быстрого доступа ниже бара' );
  cxSetResourceString(@dxSBAR_SHOWABOVERIBBON, 'Показывать тулбар быстрого доступа выше бара' );
  cxSetResourceString(@dxSBAR_MINIMIZERIBBON, 'Свернуть бар' );
  cxSetResourceString(@dxSBAR_MORECOMMANDS, 'Еще команды...' );
  cxSetResourceString(@dxSBAR_ADDTOQAT, 'Добавить в тулбар быстрого доступа' );
  cxSetResourceString(@dxSBAR_ADDTOQATITEMNAME, 'Добавить %s в тулбар быстрого доступа' );
  cxSetResourceString(@dxSBAR_REMOVEFROMQAT, 'Удалить из тулбара быстрого доступа' );
  cxSetResourceString(@dxSBAR_CUSTOMIZEQAT, 'Настроить тулбар быстрого доступа' );

  cxSetResourceString(@dxSBAR_CAPTION, 'Настроить' );
  cxSetResourceString(@dxSBAR_CLOSE, 'Закрыть' );
  cxSetResourceString(@dxSBAR_WANTTODELETETOOLBAR, 'Вы уверены, что хотите удалить %s тулбар?' );
  // ...

  // Editors
  cxSetResourceString(@cxSEditButtonCancel, 'Отмена' );
  cxSetResourceString(@cxSEditButtonOK , 'OK' );
  cxSetResourceString(@cxSEditDateConvertError , 'Невозможно сконвертировать в формат даты' );
  cxSetResourceString(@cxSEditInvalidRepositoryItem , 'Невозможно применить RepositoryItem' );
  cxSetResourceString(@cxSEditNumericValueConvertError , 'Невозможно сконвертировать в формат числа' );
  cxSetResourceString(@cxSEditPopupCircularReferencingError , 'Цикличные ссылки зарещены' );
  cxSetResourceString(@cxSEditPostError , 'Произошла ошибка при сохранении значения' );
  cxSetResourceString(@cxSEditTimeConvertError , 'Невозможно сконвертировать в формат времени' );
  cxSetResourceString(@cxSEditValidateErrorText , 'Неверные входные данные. Нажмите ESC клавишу чтобы отменить изменения' );
  cxSetResourceString(@cxSEditValueOutOfBounds , 'Значение вышло за допустимые пределы' );

  cxSetResourceString(@cxSEditCheckBoxChecked             , 'Истина' );
  cxSetResourceString(@cxSEditCheckBoxGrayed              , '' );
  cxSetResourceString(@cxSEditCheckBoxUnchecked           , 'Ложь' );
  cxSetResourceString(@cxSRadioGroupDefaultCaption        , '' );

  cxSetResourceString(@cxSTextTrue                        , 'Истина' );
  cxSetResourceString(@cxSTextFalse                       , 'Ложь' );

  // Blob
  cxSetResourceString(@cxSBlobButtonOK                    , '&OK' );
  cxSetResourceString(@cxSBlobButtonCancel                , '&Отмена' );
  cxSetResourceString(@cxSBlobButtonClose                 , '&Закрыть' );
  cxSetResourceString(@cxSBlobMemo                        , '(MEMO)' );
  cxSetResourceString(@cxSBlobMemoEmpty                   , '(memo)' );
  cxSetResourceString(@cxSBlobPicture                     , '(ИЗОБРАЖЕНИЕ)' );
  cxSetResourceString(@cxSBlobPictureEmpty                , '(изображение)' );

  // popup menu items
  cxSetResourceString(@cxSMenuItemCaptionCut              , 'Вы&резать' );
  cxSetResourceString(@cxSMenuItemCaptionCopy             , '&Копировать' );
  cxSetResourceString(@cxSMenuItemCaptionPaste            , '&Вставить' );
  cxSetResourceString(@cxSMenuItemCaptionDelete           , '&Удалить' );
  cxSetResourceString(@cxSMenuItemCaptionLoad             , '&Загрузить...' );
  cxSetResourceString(@cxSMenuItemCaptionSave             , 'Сохранить &Как...' );
  cxSetResourceString(@cxSMenuItemCaptionAssignFromWebCam , 'Получить от веб-ка&меры...' );

  // Date
  cxSetResourceString(@cxSDatePopupClear                  , 'Очистить' );
  cxSetResourceString(@cxSDatePopupNow                    , 'Сейчас' );
  cxSetResourceString(@cxSDatePopupOK                     , 'OK' );
  cxSetResourceString(@cxSDatePopupToday                  , 'Сегодня' );
  cxSetResourceString(@cxSDatePopupCancel                 , 'Отмена' );
  cxSetResourceString(@cxSDateError                       , 'Неверная дата' );

  // Calculator
  cxSetResourceString(@scxSCalcError                      , 'Ошибка' );

  // HyperLink
  cxSetResourceString(@scxSHyperLinkPrefix                , 'http://' );
  cxSetResourceString(@scxSHyperLinkDoubleSlash           , '//' );

  // Navigator
  cxSetResourceString(@cxNavigatorHint_First              , 'К первой записи' );
  cxSetResourceString(@cxNavigatorHint_Prior              , 'К предыдущей записи' );
  cxSetResourceString(@cxNavigatorHint_PriorPage          , 'К предыдущей странице' );
  cxSetResourceString(@cxNavigatorHint_Next               , 'К следующей записи' );
  cxSetResourceString(@cxNavigatorHint_NextPage           , 'К следующей странице' );
  cxSetResourceString(@cxNavigatorHint_Last               , 'К последней записи' );
  cxSetResourceString(@cxNavigatorHint_Insert             , 'Добавить новую запись' );
  cxSetResourceString(@cxNavigatorHint_Append             , 'Добавить запись в конец таблицы' );
  cxSetResourceString(@cxNavigatorHint_Delete             , 'Удалить запись под курсором' );
  cxSetResourceString(@cxNavigatorHint_Edit               , 'Редактировать запись' );
  cxSetResourceString(@cxNavigatorHint_Post               , 'Сохранить изменения данных записи' );
  cxSetResourceString(@cxNavigatorHint_Cancel             , 'Отменить изменение данных записи' );
  cxSetResourceString(@cxNavigatorHint_Refresh            , 'Обновить данные' );
  cxSetResourceString(@cxNavigatorHint_SaveBookmark       , 'Сохранить закладку' );
  cxSetResourceString(@cxNavigatorHint_GotoBookmark       , 'Найти закладку' );
  cxSetResourceString(@cxNavigatorHint_Filter             , 'Фильтр' );
  cxSetResourceString(@cxNavigator_DeleteRecordQuestion   , 'Удалить запись?' );
  cxSetResourceString(@cxNavigatorInfoPanelDefaultDisplayMask , 'Запись: [RecordIndex]/[RecordCount]' );
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
