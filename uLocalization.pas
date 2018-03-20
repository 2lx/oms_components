unit uLocalization;

interface

procedure SetupLocalization;

implementation

uses dxCore, cxGridStrs, dxBarStrs, cxEditConsts{OK}, cxFilterControlStrs{OK}, cxDataConsts, cxFilterConsts{OK};

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
end;

end.
