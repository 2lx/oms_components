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

  //------------------------------------------------------------------------------------------------
  // cxFilterControlStrs
  cxSetResourceString(@cxSFilterBoolOperatorAnd , 'И' );
  cxSetResourceString(@cxSFilterBoolOperatorOr , 'ИЛИ' );
  cxSetResourceString(@cxSFilterBoolOperatorNotAnd , 'И НЕ' );
  cxSetResourceString(@cxSFilterBoolOperatorNotOr , 'ИЛИ НЕ' );
  //
  cxSetResourceString(@cxSFilterRootButtonCaption , 'Фильтр' );
  cxSetResourceString(@cxSFilterAddCondition , 'Добавить &Условие' );
  cxSetResourceString(@cxSFilterAddGroup , 'Добавить &Группу' );
  cxSetResourceString(@cxSFilterRemoveRow , '&Удалить строку' );
  cxSetResourceString(@cxSFilterClearAll , 'Очистить &Всё' );
  cxSetResourceString(@cxSFilterFooterAddCondition , 'нажмите кнопку, чтобы добавить новое условие' );

  cxSetResourceString(@cxSFilterGroupCaption , 'применить условия' );
  cxSetResourceString(@cxSFilterRootGroupCaption , '<корень>' );
  cxSetResourceString(@cxSFilterControlNullString , '<пусто>' );

  cxSetResourceString(@cxSFilterErrorBuilding , 'Не могу построить фильтр из ресурсов' );

  //FilterDialog
  cxSetResourceString(@cxSFilterDialogCaption , 'Настройка фильтра' );
  cxSetResourceString(@cxSFilterDialogInvalidValue , 'Неверное значение' );
  cxSetResourceString(@cxSFilterDialogUse , 'Используйте' );
  cxSetResourceString(@cxSFilterDialogSingleCharacter , 'чтобы представить любой символ' );
  cxSetResourceString(@cxSFilterDialogCharactersSeries , 'чтобы представить любую группу символов' );
  cxSetResourceString(@cxSFilterDialogOperationAnd , 'И' );
  cxSetResourceString(@cxSFilterDialogOperationOr , 'ИЛИ' );
  cxSetResourceString(@cxSFilterDialogRows , 'Показать записи, в которых:' );

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
  cxSetResourceString(@cxSFilterOperatorEqual , 'точно соответствует' );
  cxSetResourceString(@cxSFilterOperatorNotEqual , 'не соответствует' );
  cxSetResourceString(@cxSFilterOperatorLess , 'меньше чем' );
  cxSetResourceString(@cxSFilterOperatorLessEqual , 'меньше или равно чем' );
  cxSetResourceString(@cxSFilterOperatorGreater , 'больше чем' );
  cxSetResourceString(@cxSFilterOperatorGreaterEqual , 'больше или равно чем' );
  cxSetResourceString(@cxSFilterOperatorLike , 'похоже (частичное совпадение для подстроки)' );
  cxSetResourceString(@cxSFilterOperatorNotLike , 'не похоже (не содержит подстроку)' );
  cxSetResourceString(@cxSFilterOperatorBetween , 'между' );
  cxSetResourceString(@cxSFilterOperatorNotBetween , 'не между' );
  cxSetResourceString(@cxSFilterOperatorInList , 'в списке' );
  cxSetResourceString(@cxSFilterOperatorNotInList , 'не в списке' );

  cxSetResourceString(@cxSFilterOperatorYesterday , '= вчера' );
  cxSetResourceString(@cxSFilterOperatorToday , '= сегодня' );
  cxSetResourceString(@cxSFilterOperatorTomorrow , '= завтра' );

  cxSetResourceString(@cxSFilterOperatorLast7Days , 'последние 7 дней' );
  cxSetResourceString(@cxSFilterOperatorLastWeek , 'последняя неделя' );
  cxSetResourceString(@cxSFilterOperatorLast14Days , 'последние 14 дней' );
  cxSetResourceString(@cxSFilterOperatorLastTwoWeeks , 'последние 2 недели' );
  cxSetResourceString(@cxSFilterOperatorLast30Days , 'последние 30 дней' );
  cxSetResourceString(@cxSFilterOperatorLastMonth , 'последний месяц' );
  cxSetResourceString(@cxSFilterOperatorLastYear , 'последний год' );
  cxSetResourceString(@cxSFilterOperatorPast , 'до текущего момента' );

  cxSetResourceString(@cxSFilterOperatorThisWeek , 'на этой неделе' );
  cxSetResourceString(@cxSFilterOperatorThisMonth , 'в этом месяце' );
  cxSetResourceString(@cxSFilterOperatorThisYear , 'в этом году' );

  cxSetResourceString(@cxSFilterOperatorNext7Days , 'в следющие 7 дней' );
  cxSetResourceString(@cxSFilterOperatorNextWeek , 'в следующую неделю' );
  cxSetResourceString(@cxSFilterOperatorNext14Days , 'в следующие 14 дней' );
  cxSetResourceString(@cxSFilterOperatorNextTwoWeeks , 'в следующие 2 недели' );
  cxSetResourceString(@cxSFilterOperatorNext30Days , 'в следующие 30 дней' );
  cxSetResourceString(@cxSFilterOperatorNextMonth , 'в следующий месяц' );
  cxSetResourceString(@cxSFilterOperatorNextYear , 'в слудующий год' );
  cxSetResourceString(@cxSFilterOperatorFuture , 'в будущем' );

  cxSetResourceString(@cxSFilterAndCaption , 'и' );
  cxSetResourceString(@cxSFilterOrCaption , 'или' );
  cxSetResourceString(@cxSFilterNotCaption , 'не' );
  cxSetResourceString(@cxSFilterBlankCaption , 'пусто' );

  // derived
  cxSetResourceString(@cxSFilterOperatorIsNull , '= пусто' );
  cxSetResourceString(@cxSFilterOperatorIsNotNull , '!= пусто' );
  cxSetResourceString(@cxSFilterOperatorBeginsWith , 'начинается с' );
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith , 'не начинается с' );
  cxSetResourceString(@cxSFilterOperatorEndsWith , 'заканчивается на' );
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith , 'не заканчивается на' );
  cxSetResourceString(@cxSFilterOperatorContains , 'содержит' );
  cxSetResourceString(@cxSFilterOperatorDoesNotContain , 'не содержит' );
  // filter listbox's values
  cxSetResourceString(@cxSFilterBoxAllCaption , '(Все)' );
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(Настройка...)' );
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(Пустые)' );
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(Не пустые)' );

  //------------------------------------------------------------------------------------------------
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

  //------------------------------------------------------------------------------------------------
  // cxSchedulerStrs
  cxSetResourceString(@scxUntitledEvent , 'Безымянное событие' );

  cxSetResourceString(@scxVertical   , 'Вертикальный' );
  cxSetResourceString(@scxHorizontal , 'Горизонтальный' );
  cxSetResourceString(@scxTimeGrid   , 'Временная шкала' );

  cxSetResourceString(@scxMinute  , 'Минута' );
  cxSetResourceString(@scxMinutes , 'Минуты' );
  cxSetResourceString(@scxHour    , 'Час' );
  cxSetResourceString(@scxHours   , 'Часы' );
  cxSetResourceString(@scxOneDay  , 'Один день' );

  // Navigation buttons
  cxSetResourceString(@scxNextAppointment , 'Следующая встреча' );
  cxSetResourceString(@scxPrevAppointment , 'Предыдущая встреча' );

  // dialogs constants
  cxSetResourceString(@scxDeleteRecurringEventDescription , 'это периодическое событие. Вы хотите удалить только текущее событие или всю серию?' );
  cxSetResourceString(@scxEditRecurringEventDescription   , 'это периодическое событие. Вы хотите открыть только текущее событие или всю серию?' );

  cxSetResourceString(@scxGoToDateDialogCaption     , 'Идти на встречу' );
  cxSetResourceString(@scxDeleteTypeDialogCaption   , 'Подтверждение удаления' );
  cxSetResourceString(@scxDeleteTypeOccurrenceLabel , 'Удалить это событие' );
  cxSetResourceString(@scxDeleteTypeSeriesLabel     , 'Удалить эту серию' );
  cxSetResourceString(@scxEditTypeDialogCaption     , 'Открыть периодическое событие' );
  cxSetResourceString(@scxEditTypeOccurrenceLabel   , 'Открыть одиночное событие' );
  cxSetResourceString(@scxEditTypeSeriesLabel       , 'Открыть серию событий' );

  cxSetResourceString(@scxExitConfirmation  , 'Вы хотите сохранить изменения?' );
  cxSetResourceString(@scxDeleteConfirmation, 'Данные изменились. Вы уверены что хотите удалить их?' );
  cxSetResourceString(@scxWrongTimeBounds   , 'Введенная вами дата окончания раньше чем дата начала.' );
  cxSetResourceString(@scxWrongPattern      , 'Периодический шаблон не верный.' );
  cxSetResourceString(@scxReplaceOccurrenceDate , 'Некоторые месяцы имеют более %s дней. Для этих месяцев событие попадет на последний день месяца.' );
  cxSetResourceString(@scxInvalidRecurrenceDuration , 'Продолжительность события должна быть короче чем оно встречается. ' +
    'Уменьшите продолжительность, или измените шаблон периодичности в диалоговом окне настройки периода.' );
  cxSetResourceString(@scxConfirmLostExceptions , 'Любые особенности связанные с этим периодическим событием будут потеряны. Это OK?' );
  cxSetResourceString(@scxInvalidNumber      , 'Вы должны ввести верное число.' );
  cxSetResourceString(@scxShedulerEditorFormNotRegistered , 'Не найдено зарегистрированных форм для редактирования.' );
  cxSetResourceString(@scxNoAvailableFreeTime , 'Не достаточно свободного времени.' );
  cxSetResourceString(@scxCannotRescheduleOccurrence , 'Cannot reschedule an occurrence of the recurring appointment "%s" if it skips over a later occurrence of the same appointment.' );
  cxSetResourceString(@scxTwoOccurrencesPerDay , 'Два события "%s" не могут случиться в один день.' );

  cxSetResourceString(@scxEvent             , 'Событие' );
  cxSetResourceString(@scxUntitled          , 'Безымянное' );

  cxSetResourceString(@scxNoneEvent         , 'простое событие' );
  cxSetResourceString(@scxRecurrenceEvent   , 'периодическое событие' );
  cxSetResourceString(@scxExceptionEvent    , 'исключительное событие' );
  cxSetResourceString(@scxOccurenceEvent    , 'одиночное событие' );

  cxSetResourceString(@scxAdd               , '&Добавить' );
  cxSetResourceString(@scxEdit              , '&Редактировать' );
  cxSetResourceString(@scxDelete            , '&Удалить' );
  cxSetResourceString(@scxRecurrence        , '&Периодичность' );
  cxSetResourceString(@scxActionRecurrence  , 'Периодичность' );

  cxSetResourceString(@scxDate              , '&Дата:' );
  cxSetResourceString(@scxShowIn            , '&Показать в:' );
  cxSetResourceString(@scxDayCalendar       , 'Календрь по дням' );
  cxSetResourceString(@scxWeekCalendar      , 'Календарь по неделям' );
  cxSetResourceString(@scxMonthCalendar     , 'Календарь по месяцам' );
  cxSetResourceString(@scxWorkWeekCalendar  , 'Календарь по рабочим неделям' );

  cxSetResourceString(@scxEventsConflict    , 'Конфликт с другим событием в вашем расписании.' );
  cxSetResourceString(@scxResource          , 'Ресурс' );
  cxSetResourceString(@scxSubject           , '&Субъект:' );
  cxSetResourceString(@scxLocation          , '&Местонахождение:' );
  cxSetResourceString(@scxLabelAs           , 'Метка как:' );
  cxSetResourceString(@scxLabel             , 'Ме&тка:' );
  cxSetResourceString(@scxStartTime         , 'Время &начала:' );
  cxSetResourceString(@scxEndTime           , 'Время &конца:' );
  cxSetResourceString(@scxAllDayEvent       , '&Событие в течение дня' );
  cxSetResourceString(@scxRecurrenceLabel   , 'Периодичность:' );

  cxSetResourceString(@scxReminder          , 'Напоминать:' );
  cxSetResourceString(@scxShowTimeAs        , 'Показать время как:' );
  cxSetResourceString(@scxShowAs            , 'Показать как:' );
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
