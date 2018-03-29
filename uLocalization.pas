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

  cxSetResourceString(@scxGridYesterday , 'Вчера' );
  cxSetResourceString(@scxGridToday , 'Сегодня' );
  cxSetResourceString(@scxGridTomorrow , 'Завтра' );
  cxSetResourceString(@scxGridLast30Days , 'Последние 30 дней' );
  cxSetResourceString(@scxGridLast14Days , 'Последние 14 дней' );
  cxSetResourceString(@scxGridLast7Days , 'Последние 7 дней' );
  cxSetResourceString(@scxGridNext7Days , 'Следующие 7 дней' );
  cxSetResourceString(@scxGridNext14Days , 'Следующие 14 дней' );
  cxSetResourceString(@scxGridNext30Days , 'Следующие 30 дней' );
  cxSetResourceString(@scxGridLastTwoWeeks , 'Последние две недели' );
  cxSetResourceString(@scxGridLastWeek , 'Последняя неделя' );
  cxSetResourceString(@scxGridThisWeek , 'Эта неделя' );
  cxSetResourceString(@scxGridNextWeek , 'Следующая неделя' );
  cxSetResourceString(@scxGridNextTwoWeeks , 'Следующие две недели' );
  cxSetResourceString(@scxGridLastMonth , 'Последний месяц' );
  cxSetResourceString(@scxGridThisMonth , 'Этот месяц' );
  cxSetResourceString(@scxGridNextMonth , 'Следующий месяц' );
  cxSetResourceString(@scxGridLastYear , 'Последний год' );
  cxSetResourceString(@scxGridThisYear , 'Этот год' );
  cxSetResourceString(@scxGridNextYear , 'Следующий год' );
  cxSetResourceString(@scxGridPast , 'в прошлом' );
  cxSetResourceString(@scxGridFuture , 'в будущем' );

  cxSetResourceString(@scxGridMonthFormat , 'mmmm yyyy' );
  cxSetResourceString(@scxGridYearFormat , 'yyyy' );

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
  cxSetResourceString(@scxLocation          , '&Место:' );
  cxSetResourceString(@scxLabelAs           , 'Метка как:' );
  cxSetResourceString(@scxLabel             , 'Ме&тка:' );
  cxSetResourceString(@scxStartTime         , 'Время &начала:' );
  cxSetResourceString(@scxEndTime           , 'Время &конца:' );
  cxSetResourceString(@scxAllDayEvent       , '&Круглодневное событие ' );
  cxSetResourceString(@scxRecurrenceLabel   , 'Периодичность:' );

  cxSetResourceString(@scxReminder          , 'Напоминать:' );
  cxSetResourceString(@scxShowTimeAs        , 'Время:' );
  cxSetResourceString(@scxShowAs            , 'Показать как:' );

  cxSetResourceString(@scxSuffixMinute      , 'минута' );
  cxSetResourceString(@scxSuffixMinutes     , 'минуты' );
  cxSetResourceString(@scxSuffixHour        , 'час' );
  cxSetResourceString(@scxSuffixHours       , 'часы' );
  cxSetResourceString(@scxSuffixDay         , 'день' );
  cxSetResourceString(@scxSuffixDays        , 'дни' );
  cxSetResourceString(@scxSuffixWeek        , 'неделя' );
  cxSetResourceString(@scxSuffixWeeks       , 'недели' );

  cxSetResourceString(@scxBusy              , 'Занят' );
  cxSetResourceString(@scxFree              , 'Свободен' );
  cxSetResourceString(@scxTentative         , 'Неопределенный' );
  cxSetResourceString(@scxOutOfOffice       , 'Не в офисе' );

  cxSetResourceString(@scxRecurrenceCaption         , 'Периодичность события' );
  cxSetResourceString(@scxRecurrenceHolidayCaption  , 'Периодичесность праздника' );

  cxSetResourceString(@scxEventTime         , ' Время события ' );
  cxSetResourceString(@scxRecurrencePattern , ' Шаблон периода ' );
  cxSetResourceString(@scxRangeOfRecurrence , ' Длительность периода ' );
  cxSetResourceString(@scxStart             , '&Начало:' );
  cxSetResourceString(@scxStart1            , 'Н&ачало:' );
  cxSetResourceString(@scxEnd               , '&Конец:' );
  cxSetResourceString(@scxDuration          , 'П&родолжительность:' );
  // Pattern
  cxSetResourceString(@scxDaily             , '&Ежедневно' );
  cxSetResourceString(@scxWeekly            , '&Еженедельно' );
  cxSetResourceString(@scxQuarterly         , '&Ежеквартально' );
  cxSetResourceString(@scxMonthly           , '&Ежемесячно' );
  cxSetResourceString(@scxYearly            , '&Ежегодно' );
  // daily
  cxSetResourceString(@scxEvery             , 'К&аждый' );
  cxSetResourceString(@scxEveryWeekDay      , 'Каждый день недели' );
  cxSetResourceString(@scxDays              , 'день(дни)' );
  // weekly
  cxSetResourceString(@scxWeeksOn           , 'неделю в:' );
  cxSetResourceString(@scxRecurEvery        , 'Повторять каждый' );
  //monthly
  cxSetResourceString(@scxOfEvery           , 'каждого' );
  cxSetResourceString(@scxMonths            , 'месяц(ы)' );
  // yearly
  cxSetResourceString(@scxThe               , 'Этот' );
  cxSetResourceString(@scxOf                , 'у' ); // of

  // Task links

  cxSetResourceString(@scxTaskComplete                   , 'Задача выполнена:' );
  cxSetResourceString(@scxTaskStatus                     , 'Статус задачи' );
  cxSetResourceString(@scxTaskDependencyEditorCaption    , 'Зависимости задачи' );
  cxSetResourceString(@scxTaskWrongTimeBounds            , 'Новая дата должна быть внутри периода %s - %s.' );
  cxSetResourceString(@scxFinishToFinishLong   , 'Конец-Конец (КК)' );
  cxSetResourceString(@scxFinishToStartLong    , 'Конец-Начало (КН)' );
  cxSetResourceString(@scxFrom                 , 'Из:' );
  cxSetResourceString(@scxStartToFinishLong    , 'Начало-Конец (НК)' );
  cxSetResourceString(@scxStartToStartLong     , 'Начало-Начало (НН)' );
  cxSetResourceString(@scxTo                   , 'К:' );
  cxSetResourceString(@scxType                 , '&Тип:' );

  // other
  cxSetResourceString(@scxFirst             , 'первый' );
  cxSetResourceString(@scxSecond            , 'второй' );
  cxSetResourceString(@scxThird             , 'третий' );
  cxSetResourceString(@scxFourth            , 'четвертый' );
  cxSetResourceString(@scxLast              , 'последний' );
  cxSetResourceString(@scxDay               , 'День' );
  cxSetResourceString(@scxDay1              , 'день' );
  cxSetResourceString(@scxWeekday           , 'день недели' );
  cxSetResourceString(@scxWeekendday        , 'выходной' );
  cxSetResourceString(@scxNoEndDate         , '&Нет конца' );
  cxSetResourceString(@scxEndAfter          , 'Закончить после:' );
  cxSetResourceString(@scxEndBy             , 'Закончить к:' );
  cxSetResourceString(@scxOccurences        , 'случай' );

  // buttons
  cxSetResourceString(@scxAdd1              , 'Добавить' );
  cxSetResourceString(@scxAdd1Hint          , 'Добавить (Ins)' );
  cxSetResourceString(@scxEditDotted        , 'Редактировать...' );
  cxSetResourceString(@scxApply             , '&Применить' );
  cxSetResourceString(@scxFindAvailableTime , 'Найти доступное время' );
  cxSetResourceString(@scxOk                , '&OK' );
  cxSetResourceString(@scxSaveAndClose      , 'Сохранить && Закрыть' );
  cxSetResourceString(@scxSaveAndCloseHint  , 'Сохранить & Закрыть' );
  cxSetResourceString(@scxSave              , 'Сохранить' );
  cxSetResourceString(@scxCancel            , '&Отмена' );
  cxSetResourceString(@scxClose             , '&Закрыть' );
  cxSetResourceString(@scxActionClose       , 'Закрыть' );
  cxSetResourceString(@scxDown              , '&Вниз' );
  cxSetResourceString(@scxDelete1           , 'Удалить' );
  cxSetResourceString(@scxDelete1Hint       , 'Удалить (Del)' );
  cxSetResourceString(@scxEdit1             , 'Редактировать' );
  cxSetResourceString(@scxImport            , '&Импорт' );
  cxSetResourceString(@scxExport            , '&Экспорт' );
  cxSetResourceString(@scxImportHint        , 'Импорт' );
  cxSetResourceString(@scxExportHint        , 'Экспорт' );
  cxSetResourceString(@scxRemoveRecur       , '&Убрать периодичность' );
  cxSetResourceString(@scxSelectAll         , 'Выделить &все' );
  cxSetResourceString(@scxSelectNone        , 'Убрать выделение' );
  cxSetResourceString(@scxUp                , '&Вверх' );
  //
  cxSetResourceString(@scxResourceLayoutCaption , 'Редактор положения ресурсов' );

  // popup menu resources
  cxSetResourceString(@scxpmNewEvent          , '&Новое событие' );
  cxSetResourceString(@scxpmNewAllDayEvent    , 'Новое целодневное событие' );
  cxSetResourceString(@scxpmNewRecurringEvent , 'Новое периодическое событие' );
  cxSetResourceString(@scxpmToday             , 'Сегодня' );
  cxSetResourceString(@scxpmGotoThisDay       , 'Перейти к этому дню' );
  cxSetResourceString(@scxpmGoToDate          , 'Перейти к дате...' );
  cxSetResourceString(@scxpmResourcesLayout   , 'Редактор положения ресурсов...' );

  // for event
  cxSetResourceString(@scxpmOpen              , '&Открыть' );
  cxSetResourceString(@scxpmEditSeries        , 'Открыть серию' );
  cxSetResourceString(@scxpmShowTimeAs        , 'Пометить время' );
  cxSetResourceString(@scxpmDelete            , '&Удалить' );
  cxSetResourceString(@scxpmFree              , '&Очистить' );
  cxSetResourceString(@scxpmTentative         , '&Попробовать' );
  cxSetResourceString(@scxpmBusy              , '&Занят' );
  cxSetResourceString(@scxpmOutOfOffice       , '&Не в офисе' );
  cxSetResourceString(@scxpmLabel             , '&Метка' );

  // event label captions
  cxSetResourceString(@scxEventLabelNone      , 'Нет' );
  cxSetResourceString(@scxEventLabel0         , 'Важное' );
  cxSetResourceString(@scxEventLabel1         , 'Бизнес' );
  cxSetResourceString(@scxEventLabel2         , 'Личное' );
  cxSetResourceString(@scxEventLabel3         , 'Отпуск' );
  cxSetResourceString(@scxEventLabel4         , 'Требует внимания' );
  cxSetResourceString(@scxEventLabel5         , 'Требуется командировка' );
  cxSetResourceString(@scxEventLabel6         , 'Требует подготовки' );
  cxSetResourceString(@scxEventLabel7         , 'День рождения' );
  cxSetResourceString(@scxEventLabel8         , 'Юбилей' );
  cxSetResourceString(@scxEventLabel9         , 'Телефонный звонок' );

  // for time ruler menu items
  cxSetResourceString(@scxpmTimeZone          , 'Изменить врем. зону' );
  cxSetResourceString(@scxpm60Minutes         , '60 минут' );
  cxSetResourceString(@scxpm30Minutes         , '30 минут' );
  cxSetResourceString(@scxpm15Minutes         , '15 минут' );
  cxSetResourceString(@scxpm10Minutes         , '10 минут' );
  cxSetResourceString(@scxpm6Minutes          , '6 минут' );
  cxSetResourceString(@scxpm5Minutes          , '5 минут' );

  // for year view scale menu items
  cxSetResourceString(@scxpmFullYear          , 'Целый год' );
  cxSetResourceString(@scxpmHalfYear          , 'Полгода' );
  cxSetResourceString(@scxpmQuarter           , 'Квартал' );

  // year view scales
  cxSetResourceString(@scxFullYear            , 'Целый год' );
  cxSetResourceString(@scxHalfYear            , 'Полгода' );
  cxSetResourceString(@scxQuarter             , 'Квартал' );
  cxSetResourceString(@scxHalfYearShort       , 'ПГ' );
  cxSetResourceString(@scxQuarterShort        , 'Кв' );

  //navigator hints
  cxSetResourceString(@scxFirstButtonHint     , 'Первый источник' );
  cxSetResourceString(@scxPrevPageButtonHint  , 'Предыдущая страница' );
  cxSetResourceString(@scxPrevButtonHint      , 'Предыдущий источник' );
  cxSetResourceString(@scxNextButtonHint      , 'Следующий источник' );
  cxSetResourceString(@scxNextPageButtonHint  , 'Следующая страница' );
  cxSetResourceString(@scxLastButtonHint      , 'Последний источник' );
  cxSetResourceString(@scxShowMoreResourcesButtonHint  , 'Показать больше источников' );
  cxSetResourceString(@scxShowFewerResourcesButtonHint , 'Показать несколько источников' );

  //for reminder
  cxSetResourceString(@scxrCaptionReminder  , 'Напоминание' );
  cxSetResourceString(@scxrCaptionReminders , '%d напоминаний' );
  cxSetResourceString(@scxrDismissButton    , '&Отклонить' );
  cxSetResourceString(@scxrDismissAllButton , 'Отклонить всё' );
  cxSetResourceString(@scxrDueIn            , 'из-за' );
  cxSetResourceString(@scxrOpenItemButton   , '&Открыть пункт' );
  cxSetResourceString(@scxrSnoozeButton     , '&Напомнить через' );
  cxSetResourceString(@scxrSubject          , 'Субъект' );
  cxSetResourceString(@scxrSnoozeLabel      , '&Напомнить еще раз' );
  cxSetResourceString(@scxrSelected         , '%d напоминаний выбрано' );
  cxSetResourceString(@scxrStartTime        , 'Время начала: %s' );

  // time
  cxSetResourceString(@scxTime0m     , '0 минут' );
  cxSetResourceString(@scxTime5m     , '5 минут' );
  cxSetResourceString(@scxTime10m    , '10 минут' );
  cxSetResourceString(@scxTime15m    , '15 минут' );
  cxSetResourceString(@scxTime20m    , '20 минут' );
  cxSetResourceString(@scxTime30m    , '30 минут' );
  cxSetResourceString(@scxTime1h     , '1 час' );
  cxSetResourceString(@scxTime2h     , '2 часа' );
  cxSetResourceString(@scxTime3h     , '3 часа' );
  cxSetResourceString(@scxTime4h     , '4 часа' );
  cxSetResourceString(@scxTime5h     , '5 часов' );
  cxSetResourceString(@scxTime6h     , '6 часов' );
  cxSetResourceString(@scxTime7h     , '7 часов' );
  cxSetResourceString(@scxTime8h     , '8 часов' );
  cxSetResourceString(@scxTime9h     , '9 часов' );
  cxSetResourceString(@scxTime10h    , '10 часов' );
  cxSetResourceString(@scxTime11h    , '11 часов' );
  cxSetResourceString(@scxTime12h    , '12 часов' );
  cxSetResourceString(@scxTime18h    , '18 часов' );
  cxSetResourceString(@scxTime1d     , '1 день' );
  cxSetResourceString(@scxTime2d     , '2 дня' );
  cxSetResourceString(@scxTime3d     , '3 дня' );
  cxSetResourceString(@scxTime4d     , '4 дня' );
  cxSetResourceString(@scxTime1w     , '1 неделя' );
  cxSetResourceString(@scxTime2w     , '2 недели' );
  // advance time
  cxSetResourceString(@scxAdvance0h  , '0 часов перед началом' );
  cxSetResourceString(@scxAdvance5m  , '5 минут перед началом' );
  cxSetResourceString(@scxAdvance10m , '10 минут перед началом' );
  cxSetResourceString(@scxAdvance15m , '15 минут перед началом' );

  // for export
{
  cxSetResourceString(@secxSetDateRangeCaption = 'Set Date Range';
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

initialization
  InitializeLocale;

end.
