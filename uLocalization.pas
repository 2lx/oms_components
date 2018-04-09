unit uLocalization;

interface

implementation

uses dxCore, cxGridStrs, cxGridPopupMenuConsts, dxBarStrs, cxFilterControlStrs, cxFilterConsts,
    cxDataConsts, cxEditConsts, cxExtEditConsts, cxLibraryStrs, cxSchedulerStrs;

procedure InitializeUnit_cxGridStrs;
begin
  cxSetResourceString(@scxGridRecursiveLevels, 'Вы не можете создать рекурсивные уровни' );

  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Удалить запись?' );
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Удалить все выделенные записи?' );

  cxSetResourceString(@scxGridNoDataInfoText, 'НЕТ ДАННЫХ ДЛЯ ОТОБРАЖЕНИЯ' );

  cxSetResourceString(@scxGridFilterRowInfoText, 'СТРОКА ДЛЯ УКАЗАНИЯ ФИЛЬТРОВ' );
  cxSetResourceString(@scxGridNewItemRowInfoText, 'СТРОКА ДЛЯ ДОБАВЛЕНИЯ ЗАПИСИ' );

  cxSetResourceString(@scxGridFindPanelClearButtonCaption , 'Очистить' );
  cxSetResourceString(@scxGridFindPanelFindButtonCaption , 'Найти' );
  cxSetResourceString(@scxGridFindPanelInfoText , 'Введите текст, который надо найти...' );

  cxSetResourceString(@scxGridFilterIsEmpty, '<Фильтр пуст>' );

  cxSetResourceString(@scxGridCustomizationFormCaption, 'Настройка' );
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Колонки' );
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Перетащите заголовок столбца на это поле...');
  cxSetResourceString(@scxGridFilterApplyButtonCaption, 'Применить фильтр' );
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Настроить...' );
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, 'Щелкните здесь, чтобы показать\скрыть\перетащить столбцы');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Банды' );
  cxSetResourceString(@scxGridBandsQuickCustomizationHint, 'Щелкните здесь, чтобы показать\скрыть\перетащить столбцы' );

  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, 'Строки' );

  cxSetResourceString(@scxGridConverterIntermediaryMissing, 'Отсутсвует промежуточный компонент!'#13#10'Пожалуйста, добавьте %s компонент на форму.' );
  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid не существует' );
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Компонент не существует' );
  cxSetResourceString(@scxImportErrorCaption, 'Ошибка импорта' );

  cxSetResourceString(@scxNotExistGridView, 'Grid view не существует' );

  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem, 'ExtLookupComboBox|Представляет ультра-навороченный ниспадающий список c использованием QuantumGrid' );

  // date ranges

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

  // ChartView

  cxSetResourceString(@scxGridChartCategoriesDisplayText, 'Данные' );

  cxSetResourceString(@scxGridChartValueHintFormat , '%s для %s это %s' );  // series display text, category, value
  cxSetResourceString(@scxGridChartPercentValueTickMarkLabelFormat , '0%' );

  cxSetResourceString(@scxGridChartToolBoxDataLevels , 'Уровни данных:' );
  cxSetResourceString(@scxGridChartToolBoxDataLevelSelectValue , 'выберите значение' );
  cxSetResourceString(@scxGridChartToolBoxCustomizeButtonCaption , 'Настройка чарта' );

  cxSetResourceString(@scxGridChartNoneDiagramDisplayText , 'Нет диаграммы' );
  cxSetResourceString(@scxGridChartColumnDiagramDisplayText , 'Column-диаграмма' );
  cxSetResourceString(@scxGridChartBarDiagramDisplayText , 'Бар-диаграмма' );
  cxSetResourceString(@scxGridChartLineDiagramDisplayText , 'Line-диаграмма' );
  cxSetResourceString(@scxGridChartAreaDiagramDisplayText , 'Area-диаграмма' );
  cxSetResourceString(@scxGridChartPieDiagramDisplayText , 'Pie-диаграмма' );
  cxSetResourceString(@scxGridChartStackedBarDiagramDisplayText , 'Stacked Bars-диаграмма' );
  cxSetResourceString(@scxGridChartStackedColumnDiagramDisplayText , 'Stacked Columns-диаграмма' );
  cxSetResourceString(@scxGridChartStackedAreaDiagramDisplayText , 'Stacked Area-диаграмма' );

  cxSetResourceString(@scxGridChartCustomizationFormSeriesPageCaption , 'Серия' );
  cxSetResourceString(@scxGridChartCustomizationFormSortBySeries , 'Сортировать:' );
  cxSetResourceString(@scxGridChartCustomizationFormNoSortedSeries , '<нет серий>' );
  cxSetResourceString(@scxGridChartCustomizationFormDataGroupsPageCaption , 'Группа данных' );
  cxSetResourceString(@scxGridChartCustomizationFormOptionsPageCaption , 'Опции' );

  cxSetResourceString(@scxGridChartLegend , 'Легенда' );
  cxSetResourceString(@scxGridChartLegendKeyBorder , 'Key Border' );
  cxSetResourceString(@scxGridChartPosition , 'Позиция' );
  cxSetResourceString(@scxGridChartPositionDefault , 'По умолчанию' );
  cxSetResourceString(@scxGridChartPositionNone , 'Нет' );
  cxSetResourceString(@scxGridChartPositionLeft , 'Слева' );
  cxSetResourceString(@scxGridChartPositionTop , 'Сверху' );
  cxSetResourceString(@scxGridChartPositionRight , 'Справа' );
  cxSetResourceString(@scxGridChartPositionBottom , 'Внизу' );
  cxSetResourceString(@scxGridChartAlignment , 'Расположение' );
  cxSetResourceString(@scxGridChartAlignmentDefault , 'По умолчанию' );
  cxSetResourceString(@scxGridChartAlignmentStart , 'Начало' );
  cxSetResourceString(@scxGridChartAlignmentCenter , 'Центр' );
  cxSetResourceString(@scxGridChartAlignmentEnd , 'Конец' );
  cxSetResourceString(@scxGridChartOrientation , 'Ориентация' );
  cxSetResourceString(@scxGridChartOrientationDefault , 'По умолчанию' );
  cxSetResourceString(@scxGridChartOrientationHorizontal , 'Горизонтальный' );
  cxSetResourceString(@scxGridChartOrientationVertical , 'Вертикальный' );
  cxSetResourceString(@scxGridChartBorder , 'Край' );
  cxSetResourceString(@scxGridChartTitle , 'Заголовок' );
  cxSetResourceString(@scxGridChartToolBox , 'ToolBox' );
  cxSetResourceString(@scxGridChartDiagramSelector , 'Выбор диаграммы' );
  cxSetResourceString(@scxGridChartOther , 'Другой' );
  cxSetResourceString(@scxGridChartValueHints , 'Подсказки значений' );

  cxSetResourceString( @scxGridLayoutViewCustomizeFormOk, 'OK' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormCancel, 'Отмена' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormApply, 'Применить' );
  cxSetResourceString( @scxGridLayoutViewCustomizeWarningDialogCaption, 'Внимание' );
  cxSetResourceString( @scxGridLayoutViewCustomizeWarningDialogMessage, 'Layout изменено. Вы хотите сохранить изменения?' );
  cxSetResourceString( @scxGridLayoutViewCustomizeLayoutButtonCaption, 'Редактор Layout' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormTemplateCard, 'Карта шаблона' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormViewLayout, 'Показать Layout' );
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask, 'Запись: [RecordIndex]/[RecordCount]' );

  cxSetResourceString(@scxGridLockedStateImageText, 'Пожалуйста, ждите...' );

  cxSetResourceString(@scxGridInplaceEditFormButtonCancel, 'Отмена' );
  cxSetResourceString(@scxGridInplaceEditFormButtonClose, 'Close' );
  cxSetResourceString(@scxGridInplaceEditFormButtonUpdate, 'Обновить' );
  cxSetResourceString(@scxGridInplaceEditFormSaveChangesQuery, 'Данные были изменены. Вы хотите сохранить изменения?' );
end;

procedure InitializeUnit_cxGridPopupMenuConsts;
begin
  cxSetResourceString(@cxSGridNone , 'Нет' );

  // Header popup menu item captions

  cxSetResourceString(@cxSGridSortColumnAsc , 'Восходящая сортировка' );
  cxSetResourceString(@cxSGridSortColumnDesc , 'Нисходящая сортировка' );
  cxSetResourceString(@cxSGridClearSorting , 'Очистить сортировку' );
  cxSetResourceString(@cxSGridGroupByThisField , 'Группировать по этому полю' );
  cxSetResourceString(@cxSGridRemoveThisGroupItem , 'Удалить из группировки' );
  cxSetResourceString(@cxSGridGroupByBox , 'Поле группировки' );
  cxSetResourceString(@cxSGridAlignmentSubMenu , 'Расположение' );
  cxSetResourceString(@cxSGridAlignLeft , 'Расположить слева' );
  cxSetResourceString(@cxSGridAlignRight , 'Расположить справа' );
  cxSetResourceString(@cxSGridAlignCenter , 'Расположить по центру' );
  cxSetResourceString(@cxSGridRemoveColumn , 'Удалить этот столбец' );
  cxSetResourceString(@cxSGridFieldChooser , 'Выбрать поле' );
  cxSetResourceString(@cxSGridBestFit , 'Лучшее расположение' );
  cxSetResourceString(@cxSGridBestFitAllColumns , 'Лучшее расположение (все столбцы)' );
  cxSetResourceString(@cxSGridShowFooter , 'колонтитул' );
  cxSetResourceString(@cxSGridShowGroupFooter , 'Группировка колонтитулов' );
  cxSetResourceString(@cxSGridShowFindPanel , 'Найти панель' );
  cxSetResourceString(@cxSGridFullExpand , 'Полностью развернуть' );
  cxSetResourceString(@cxSGridFullCollapse , 'Полностью свернуть' );
  cxSetResourceString(@cxSGridClearGrouping , 'Очистить группировку' );
  cxSetResourceString(@cxSGridHideGroupByBox , 'Скрыть поле группировки' );

  // Footer popup menu item captions

  cxSetResourceString(@cxSGridNoneMenuItem , 'Нет' );
  cxSetResourceString(@cxSGridSumMenuItem , 'Сумма' );
  cxSetResourceString(@cxSGridMinMenuItem , 'Мин' );
  cxSetResourceString(@cxSGridMaxMenuItem , 'Макс' );
  cxSetResourceString(@cxSGridCountMenuItem , 'Кол-во' );
  cxSetResourceString(@cxSGridAvgMenuItem , 'Среднее' );

  // Group row popup menu item captions

  cxSetResourceString(@cxSGridSortByGroupValues, 'Соритировать по значению группировки' );
  cxSetResourceString(@cxSGridSortBySummaryCaption, 'Сортировать по сумме группировки:' );
  cxSetResourceString(@cxSGridSortBySummary, '%s для %s' );
end;

procedure InitializeUnit_dxBarStrs;
begin
{  dxSBAR_LOOKUPDIALOGCAPTION = 'Select value';
  dxSBAR_LOOKUPDIALOGOK = 'OK';
  dxSBAR_LOOKUPDIALOGCANCEL = 'Cancel';

  dxSBAR_DIALOGOK = 'OK';
  dxSBAR_DIALOGCANCEL = 'Cancel';
  dxSBAR_COLOR_STR_0 = 'Black';
  dxSBAR_COLOR_STR_1 = 'Maroon';
  dxSBAR_COLOR_STR_2 = 'Green';
  dxSBAR_COLOR_STR_3 = 'Olive';
  dxSBAR_COLOR_STR_4 = 'Navy';
  dxSBAR_COLOR_STR_5 = 'Purple';
  dxSBAR_COLOR_STR_6 = 'Teal';
  dxSBAR_COLOR_STR_7 = 'Gray';
  dxSBAR_COLOR_STR_8 = 'Silver';
  dxSBAR_COLOR_STR_9 = 'Red';
  dxSBAR_COLOR_STR_10 = 'Lime';
  dxSBAR_COLOR_STR_11 = 'Yellow';
  dxSBAR_COLOR_STR_12 = 'Blue';
  dxSBAR_COLOR_STR_13 = 'Fuchsia';
  dxSBAR_COLOR_STR_14 = 'Aqua';
  dxSBAR_COLOR_STR_15 = 'White';
  dxSBAR_COLORAUTOTEXT = '(automatic)';
  dxSBAR_COLORCUSTOMTEXT = '(custom)';
  dxSBAR_DATETODAY = 'Today';
  dxSBAR_DATECLEAR = 'Clear';
  dxSBAR_DATEDIALOGCAPTION = 'Select the date';
  dxSBAR_TREEVIEWDIALOGCAPTION = 'Select item';
  dxSBAR_IMAGEDIALOGCAPTION = 'Select item';
  dxSBAR_IMAGEINDEX = 'Image Index';
  dxSBAR_IMAGETEXT = 'Text';
  dxSBAR_PLACEFORCONTROL = 'The place for the ';
  dxSBAR_CANTASSIGNCONTROL = 'You cannot assign the same control to more than one TdxBarControlContainerItem';
  dxSBAR_CXEDITVALUEDIALOGCAPTION = 'Enter value';

  dxSBAR_WANTTORESETTOOLBAR = 'Are you sure you want to reset the changes made to the ''%s'' toolbar?';
  dxSBAR_WANTTORESETUSAGEDATA = 'This will delete the record of the commands you''ve used in this application and restore the default set of visible commands to the menus and toolbars. It will not undo any explicit customizations.   Are you sure you want to proceed?';
  dxSBAR_BARMANAGERMORETHANONE  = 'A control should contain only a single TdxBarManager';
  dxSBAR_BARMANAGERBADOWNER = 'TdxBarManager should have TWinControl as its Owner';
  dxSBAR_NOBARMANAGERS = 'There are no TdxBarManagers available';
  dxSBAR_WANTTODELETETOOLBAR = 'Are you sure you want to delete the ''%s'' toolbar?';
  dxSBAR_WANTTODELETETOOLBARS = 'Are you sure you want to delete selected toolbars?';
  dxSBAR_WANTTODELETECATEGORY = 'Are you sure you want to delete the ''%s'' category?';
  dxSBAR_WANTTOCLEARCOMMANDS = 'Are you sure you want to delete all commands in the ''%s'' category?';
  dxSBAR_RECURSIVEMENUS = 'You cannot create recursive menus';
  dxSBAR_COMMANDNAMECANNOTBEBLANK = 'A command name cannot be blank. Please enter a name.';
  dxSBAR_TOOLBAREXISTS = 'A toolbar named ''%s'' already exists. Type another name.';
  dxSBAR_RECURSIVEGROUPS = 'You cannot create recursive groups';
  dxSBAR_WANTTODELETECOMPLEXITEM = 'One of the selected objects is an item which has several links. Are you sure you want to delete these links?';
  dxSBAR_CANTPLACEQUICKACCESSGROUPBUTTON = 'You can place TdxRibbonQuickAccessGroupButton only on TdxRibbonQuickAccessToolbar';
  dxSBAR_QUICKACCESSGROUPBUTTONTOOLBARNOTDOCKEDINRIBBON = 'Quick Access Group Button''s Toolbar is not docked in the Ribbon';
  dxSBAR_QUICKACCESSALREADYHASGROUPBUTTON = 'The Quick Access Toolbar already contains GroupButton with the same toolbar';
  dxSBAR_CANTPLACESEPARATOR = 'A separator item cannot be placed on the specified toolbar';
  dxSBAR_CANTPLACERIBBONGALLERY = 'You can place TdxRibbonGalleryItem into a submenu or Ribbon control';
  dxSBAR_CANTPLACESKINCHOOSERGALLERY = 'You can place TdxSkinChooserGalleryItem into a submenu or Ribbon control';

  dxSBAR_CANTMERGEBARMANAGER = 'You cannot merge with the specified bar manager';
  dxSBAR_CANTMERGETOOLBAR = 'You cannot merge with the specified toolbar';
  dxSBAR_CANTMERGEWITHMERGEDTOOLBAR = 'You cannot merge a toolbar with a toolbar that is already merged';
  dxSBAR_CANTUNMERGETOOLBAR = 'You cannot unmerge the specified toolbar';
  dxSBAR_ONEOFTOOLBARSALREADYMERGED = 'One of the toolbars of the specified bar manager is already merged';
  dxSBAR_ONEOFTOOLBARSHASMERGEDTOOLBARS = 'One of the toolbars of the specified bar manager has merged toolbars';
  dxSBAR_TOOLBARHASMERGEDTOOLBARS = 'The ''%s'' toolbar has merged toolbars';
  dxSBAR_TOOLBARSALREADYMERGED = 'The ''%s'' toolbar is already merged with the ''%s'' toolbar';
  dxSBAR_TOOLBARSARENOTMERGED = 'The ''%s'' toolbar is not merged with the ''%s'' toolbar';

  dxSBAR_RIBBONCANTMERGE = 'You cannot merge with the specified Ribbon';
  dxSBAR_RIBBONCANTMERGETAB = 'You cannot merge with the specified Ribbon tab';
  dxSBAR_RIBBONCANTMERGEWITHOUTBARMANAGER = 'You cannot merge Ribbons with no bar managers specified';
  dxSBAR_RIBBONCANTUNMERGE = 'You cannot unmerge the specified Ribbon';
  dxSBAR_RIBBONCANTUNMERGETAB = 'You cannot unmerge the specified Ribbon tab';
  dxSBAR_RIBBONONEOFTABGROUPSALREADYMERGED = 'One of the Ribbon tab groups of the specified Ribbon tab is already merged';
  dxSBAR_RIBBONSARENOTMERGED = 'The ''%s'' Ribbon is not merged with the ''%s'' Ribbon';
  dxSBAR_RIBBONTABSARENOTMERGED = 'The ''%s'' Ribbon tab is not merged with the ''%s'' Ribbon tab';

  dxSBAR_RIBBON_MINIMIZERIBBON = 'Collapse the Ribbon';
  dxSBAR_RIBBON_PINRIBBON = 'Pin the Ribbon';
  dxSBAR_RIBBON_RESTORERIBBON = 'Expand the Ribbon';
  dxSBAR_RIBBONFORM_CLOSE = 'Close';
  dxSBAR_RIBBONFORM_DISPLAYOPTIONS = 'Ribbon Display Options';
  dxSBAR_RIBBONFORM_HELP = 'Help';
  dxSBAR_RIBBONFORM_MAXIMIZE = 'Maximize';
  dxSBAR_RIBBONFORM_MINIMIZE = 'Minimize';
  dxSBAR_RIBBONFORM_RESTOREDOWN = 'Restore Down';
  dxSBAR_RIBBONFORM_RESTOREUP = 'Restore Up';
  dxSBAR_RIBBONDISPLAYOPTIONS_AUTOHIDERIBBON_CAPTION = 'Auto-hide Ribbon';
  dxSBAR_RIBBONDISPLAYOPTIONS_AUTOHIDERIBBON_DESCRIPTION = 'Hide the Ribbon. Click at the top of the application to show it.';
  dxSBAR_RIBBONDISPLAYOPTIONS_SHOWTABS_CAPTION = 'Show Tabs';
  dxSBAR_RIBBONDISPLAYOPTIONS_SHOWTABS_DESCRIPTION = 'Show Ribbon tabs only. Click a tab to show the commands.';
  dxSBAR_RIBBONDISPLAYOPTIONS_SHOWTABSANDCOMMANDS_CAPTION = 'Show Tabs and Commands';
  dxSBAR_RIBBONDISPLAYOPTIONS_SHOWTABSANDCOMMANDS_DESCRIPTION = 'Show Ribbon tabs and commands all the time.';

  dxSBAR_DEFAULTCATEGORYNAME = 'Default';
  // begin DesignTime section
  dxSBAR_NEWBUTTONCAPTION = 'New Button';
  dxSBAR_NEWITEMCAPTION = 'New Item';
  dxSBAR_NEWRIBBONGALLERYITEMCAPTION = 'New Gallery';
  dxSBAR_NEWSEPARATORCAPTION = 'New Separator';
  dxSBAR_NEWSUBITEMCAPTION = 'New SubItem';

  dxSBAR_CP_ADDSUBITEM = 'Add &SubItem';
  dxSBAR_CP_ADDBUTTON = 'Add &Button';
  dxSBAR_CP_ADDLARGEBUTTON = 'Add L&argeButton';
  dxSBAR_CP_ADDSEPARATOR = 'Add &Separator';
  dxSBAR_CP_ADDDXITEM = 'Add &Item';
  dxSBAR_CP_ADDCXITEM = 'Add &cxEditItem';
  dxSBAR_CP_ADDGROUPBUTTON = 'Add Gro&upButton';
  dxSBAR_CP_DELETEITEM = 'Delete Item';
  dxSBAR_CP_DELETELINK = 'Delete Link';
  // end DesignTime section

  dxSBAR_CP_RESET = '&Reset';
  dxSBAR_CP_DELETE = '&Delete';
  dxSBAR_CP_NAME = '&Name:';
  dxSBAR_CP_CAPTION = '&Caption:'; // is the same as dxSBAR_CP_NAME (at design time)
  dxSBAR_CP_BUTTONPAINTSTYLEMENU = 'Button Paint &Style';
  dxSBAR_CP_DEFAULTSTYLE = 'Defa&ult style';
  dxSBAR_CP_TEXTONLYALWAYS = '&Text Only (Always)';
  dxSBAR_CP_TEXTONLYINMENUS = 'Text &Only (in Menus)';
  dxSBAR_CP_IMAGEANDTEXT = 'Image &and Text';
  dxSBAR_CP_BEGINAGROUP = 'Begin a &Group';
  dxSBAR_CP_VISIBLE = '&Visible';
  dxSBAR_CP_MOSTRECENTLYUSED = '&Most recently used';
  // begin DesignTime section
  dxSBAR_CP_DISTRIBUTED = 'Dis&tributed';
  dxSBAR_CP_POSITIONMENU = '&Position';
  dxSBAR_CP_VIEWLEVELSMENU = 'View&Levels';
  dxSBAR_CP_ALLVIEWLEVELS = 'All';
  dxSBAR_CP_SINGLEVIEWLEVELITEMSUFFIX = ' ONLY';
  dxSBAR_CP_BUTTONGROUPMENU = 'ButtonG&roup';
  dxSBAR_CP_BUTTONGROUP = 'Group';
  dxSBAR_CP_BUTTONUNGROUP = 'Ungroup';
  // end DesignTime section

  dxSBAR_ADDEX = 'Add...';
  dxSBAR_RENAMEEX = 'Rename...';
  dxSBAR_DELETE = 'Delete';
  dxSBAR_CLEAR = 'Clear';
  dxSBAR_VISIBLE = 'Visible';
  dxSBAR_OK = 'OK';
  dxSBAR_CANCEL = 'Cancel';
  dxSBAR_SUBMENUEDITOR = 'SubMenu Editor...';
  dxSBAR_SUBMENUEDITORCAPTION = 'ExpressBars SubMenu Editor';
  dxSBAR_INSERTEX = 'Insert...';

  dxSBAR_MOVEUP = 'Move Up';
  dxSBAR_MOVEDOWN = 'Move Down';
  dxSBAR_POPUPMENUEDITOR = 'PopupMenu Editor...';
  dxSBAR_TABSHEET1 = ' Toolbars ';
  dxSBAR_TABSHEET2 = ' Commands ';
  dxSBAR_TABSHEET3 = ' Options ';
  dxSBAR_TOOLBARS = 'Toolb&ars:';
  dxSBAR_TNEW = '&New...';
  dxSBAR_TRENAME = 'R&ename...';
  dxSBAR_TDELETE = '&Delete';
  dxSBAR_TRESET = '&Reset...';
  dxSBAR_CLOSE = 'Close';
  dxSBAR_CAPTION = 'Customize';
  dxSBAR_CATEGORIES = 'Cate&gories:';
  dxSBAR_COMMANDS = 'Comman&ds:';
  dxSBAR_DESCRIPTION = 'Description  ';

  dxSBAR_MDIMINIMIZE = 'Minimize Window';
  dxSBAR_MDIRESTORE = 'Restore Window';
  dxSBAR_MDICLOSE = 'Close Window';
  dxSBAR_CUSTOMIZE = '&Customize...';
  dxSBAR_ADDREMOVEBUTTONS = '&Add or Remove Buttons';
  dxSBAR_MOREBUTTONS = 'More Buttons';
  dxSBAR_RESETTOOLBAR = '&Reset Toolbar';
  dxSBAR_EXPAND = 'Expand (Ctrl-Down)';
  dxSBAR_DRAGTOMAKEMENUFLOAT = 'Drag to make this menu float';
  dxSBAR_MORECOMMANDS = '&More Commands...';
  dxSBAR_SHOWBELOWRIBBON = '&Show Quick Access Toolbar Below the Ribbon';
  dxSBAR_SHOWABOVERIBBON = '&Show Quick Access Toolbar Above the Ribbon';
  dxSBAR_MINIMIZERIBBON = 'Mi&nimize the Ribbon';
  dxSBAR_CUSTOMIZERIBBON = 'Customize the &Ribbon...';
  dxSBAR_CUSTOMIZERIBBONQAT = '&Customize Quick Access Toolbar...';
  dxSBAR_ADDTOQAT = '&Add to Quick Access Toolbar';
  dxSBAR_ADDTOQATITEMNAME = '&Add %s to Quick Access Toolbar';
  dxSBAR_REMOVEFROMQAT = '&Remove from Quick Access Toolbar';
  dxSBAR_CUSTOMIZEQAT = 'Customize Quick Access Toolbar';
  dxSBAR_ADDGALLERYNAME = 'Gallery';
  dxSBAR_SHOWALLGALLERYGROUPS = 'Show all groups';
  dxSBAR_HIDEALLGALLERYGROUPS = 'Hide all groups';
  dxSBAR_CLEARGALLERYFILTER = 'Clear filter';
  dxSBAR_GALLERYEMPTYFILTERCAPTION = '<empty>';
  dxSBAR_PIN = 'Pin this item to the list';
  dxSBAR_UNPIN = 'Unpin this item from the list';

  dxSBAR_TOOLBARNEWNAME  = 'Custom ';
  dxSBAR_CATEGORYADD  = 'Add Category';
  dxSBAR_CATEGORYINSERT  = 'Insert Category';
  dxSBAR_CATEGORYRENAME  = 'Rename Category';
  dxSBAR_TOOLBARADD  = 'Add Toolbar';
  dxSBAR_TOOLBARRENAME  = 'Rename Toolbar';
  dxSBAR_CATEGORYNAME  = '&Category name:';
  dxSBAR_TOOLBARNAME  = '&Toolbar name:';
  dxSBAR_CUSTOMIZINGFORM = 'Customization Form...';

  dxSBAR_MODIFY = '... modify';
  dxSBAR_PERSMENUSANDTOOLBARS = 'Personalized Menus and Toolbars  ';
  dxSBAR_MENUSSHOWRECENTITEMS = 'Me&nus show recently used commands first';
  dxSBAR_SHOWFULLMENUSAFTERDELAY = 'Show f&ull menus after a short delay';
  dxSBAR_RESETUSAGEDATA = '&Reset my usage data';

  dxSBAR_OTHEROPTIONS = 'Other  ';
  dxSBAR_LARGEICONS = '&Large icons';
  dxSBAR_HINTOPT1 = 'Show Tool&Tips on toolbars';
  dxSBAR_HINTOPT2 = 'Show s&hortcut keys in ToolTips';
  dxSBAR_MENUANIMATIONS = '&Menu animations:';
  dxSBAR_MENUANIM1 = '(None)';
  dxSBAR_MENUANIM2 = 'Random';
  dxSBAR_MENUANIM3 = 'Unfold';
  dxSBAR_MENUANIM4 = 'Slide';
  dxSBAR_MENUANIM5 = 'Fade';

  dxSBAR_CANTFINDBARMANAGERFORSTATUSBAR = 'A bar manager cannot be found for the status bar';

  dxSBAR_BUTTONDEFAULTACTIONDESCRIPTION = 'Press';

  SBlob = '(Blob)';

  dxSBAR_APPMENUOUTSIDERIBBON = 'The Application Menu cannot be displayed outside the Ribbon';
  dxSBAR_EXTRAPANEHEADER = 'Recent Documents';
  dxSBAR_GDIPLUSNEEDED = '%s requires the Microsoft GDI+ library to be installed';
  dxSBAR_RIBBONMORETHANONE  = 'There should be only one %s instance on the form';
  dxSBAR_RIBBONBADOWNER = '%s should have TCustomForm as its Owner';
  dxSBAR_RIBBONBADPARENT = '%s should have TCustomForm as its Parent';
  dxSBAR_RIBBONADDTAB = 'Add Tab';
  dxSBAR_RIBBONDELETETAB = 'Delete Tab';
  dxSBAR_RIBBONADDEMPTYGROUP = 'Add Empty Group';
  dxSBAR_RIBBONADDGROUPWITHTOOLBAR = 'Add Group With Toolbar';
  dxSBAR_RIBBONDELETEGROUP = 'Delete Group';

  dxSBAR_ACCESSIBILITY_RIBBONNAME = 'Ribbon';
  dxSBAR_ACCESSIBILITY_RIBBONTABCOLLECTIONNAME = 'Ribbon Tabs';

  sdxRibbonCustomizationFormAddErrorMsg = 'Commands need to be added to custom groups. ' +
    'To create a group, pick a tab in the list, then click New Group.';
  sdxRibbonCustomizationFormAllCommands = 'All Commands';
  sdxRibbonCustomizationFormAllTabs = 'All Tabs';
  sdxRibbonCustomizationFormBeginGroup = '<Separator>';
  sdxRibbonCustomizationFormCommandsNotInTheRibbon = 'Commands Not in the Ribbon';
  sdxRibbonCustomizationFormCustomElementSuffix = ' (Custom)';
  sdxRibbonCustomizationFormCustomGroups = 'Custom Groups';
  sdxRibbonCustomizationFormCustomTabsAndGroups = 'Custom Tabs and Groups';
  sdxRibbonCustomizationFormDelimiterContextTab = ' | ';
  sdxRibbonCustomizationFormDisplayName = 'Display name';
  sdxRibbonCustomizationFormMainTabs = 'Main Tabs';
  sdxRibbonCustomizationFormNewContext = 'New Context';
  sdxRibbonCustomizationFormNewGroup = 'New Group';
  sdxRibbonCustomizationFormNewTab = 'New Tab';
  sdxRibbonCustomizationFormRename = 'Rename';
  sdxRibbonCustomizationFormTabSuffix = ' Tab';
  sdxRibbonCustomizationFormToolTabs = 'Tool Tabs';
  //Captions
  sdxRibbonCustomizationFormCaptionAdd = '&Add';
  sdxRibbonCustomizationFormCaptionAddNewContext = 'Add New &Context';
  sdxRibbonCustomizationFormCaptionAddNewGroup = 'Add New &Group';
  sdxRibbonCustomizationFormCaptionAddNewTab = 'Add New &Tab';
  sdxRibbonCustomizationFormCaptionCancel = '&Cancel';
  sdxRibbonCustomizationFormCaptionCommandsSource = 'C&hoose commands from:';
  sdxRibbonCustomizationFormCaptionMoveDown = 'Move &Down';
  sdxRibbonCustomizationFormCaptionMoveUp = 'Move &Up';
  sdxRibbonCustomizationFormCaptionNewElement = '&Add';
  sdxRibbonCustomizationFormCaptionOK = '&OK';
  sdxRibbonCustomizationFormCaptionQuickAccessToolbar = 'Customize &Quick Access Toolbar:';
  sdxRibbonCustomizationFormCaptionQuickAccessToolbarShowBelowRibbon = 'Show Quick Access Toolbar below the Ribbon';
  sdxRibbonCustomizationFormCaptionQuickAccessToolbarTitle = 'Quick Access Toolbar Customization';
  sdxRibbonCustomizationFormCaptionRemove = '&Remove';
  sdxRibbonCustomizationFormCaptionRename = 'Rena&me...';
  sdxRibbonCustomizationFormCaptionReset = 'R&eset';
  sdxRibbonCustomizationFormCaptionResetAllCustomizations = 'Reset a&ll customizations';
  sdxRibbonCustomizationFormCaptionResetOnlySelectedTab = 'Reset only &selected tab';
  sdxRibbonCustomizationFormCaptionResetSelectedTab = 'Reset Ta&b';
  sdxRibbonCustomizationFormCaptionRibbonTitle = 'Ribbon Customization';
  sdxRibbonCustomizationFormCaptionRibbonSource = 'Customize the Ri&bbon:';
  sdxRibbonCustomizationFormCaptionShowTab = '&Show Tab';

  // sdxRibbonColorGallery
  sdxRibbonColorGalleryAutoColor = 'Auto';
  sdxRibbonColorGalleryMoreColors = '&More Colors...';
  sdxRibbonColorGalleryGroupCustomColors = 'Custom Colors';
  sdxRibbonColorGalleryGroupStandardColors = 'Standard Colors';
  sdxRibbonColorGalleryGroupThemeColors = 'Theme Colors';  }

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
end;

procedure InitializeUnit_cxFilterControlStrs;
begin
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

  // FilterControlDialog
  cxSetResourceString(@cxSFilterControlDialogCaption , 'Генератор фильтра' );
  cxSetResourceString(@cxSFilterControlDialogNewFile , 'безымянный.flt' );
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption , 'Открыть существующий фильтр' );
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption , 'Сохранить активный фильтр в файл' );
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&Сохранить как...' );
  cxSetResourceString(@cxSFilterControlDialogActionSaveHint , 'Сохранить как|Сохранить активный фильтр с новым именем' );
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&Открыть...' );
  cxSetResourceString(@cxSFilterControlDialogActionOpenHint , 'Открыть|Открыть существующий фильтр' );
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , '&Применить' );
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption , 'OK' );
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption , 'Отмена' );
  cxSetResourceString(@cxSFilterControlDialogFileExt , 'flt' );
  cxSetResourceString(@cxSFilterControlDialogFileFilter , 'Фильтры (*.flt)|*.flt' );
end;

procedure InitializeUnit_cxFilterConsts;
begin
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
end;

procedure InitializeUnit_cxDataConsts;
begin
  cxSetResourceString(@cxSDataReadError , 'Ошибка потока чтения' );
  cxSetResourceString(@cxSDataWriteError , 'Ошибка потока записи' );
  cxSetResourceString(@cxSDataItemExistError , 'Пункт уже существует' );
  cxSetResourceString(@cxSDataRecordIndexError , 'RecordIndex out of range' );
  cxSetResourceString(@cxSDataItemIndexError , 'ItemIndex out of range' );
  cxSetResourceString(@cxSDataProviderModeError , 'Эта операция не поддерживается в provider mode' );
  cxSetResourceString(@cxSDataInvalidStreamFormat , 'Неверный формат потока' );
  cxSetResourceString(@cxSDataRowIndexError , 'RowIndex out of range' );
  cxSetResourceString(@cxSDataCustomDataSourceInvalidCompare , 'GetInfoForCompare not implemented' );
  // DB
  cxSetResourceString(@cxSDBDetailFilterControllerNotFound , 'DetailFilterController не найден' );
  cxSetResourceString(@cxSDBNotInGridMode , 'DataController не в GridMode' );
  cxSetResourceString(@cxSDBKeyFieldNotFound , 'Ключевое поле не найдено' );
end;

procedure InitializeUnit_cxEditConsts;
begin
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

procedure InitializeUnit_cxSchedulerStrs;
begin
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

procedure InitializeUnit_cxExtEditConsts;
begin
{  scxSEditRepositoryColorComboBoxItem = 'ColorComboBox |Represents a editor with color functionality';
  scxSEditRepositoryColorEditItem = 'ColorEdit|Represents an edit control with a dropdown color gallery';
  scxSEditRepositoryFontNameComboBoxItem = 'FontNameComboBox |Represents a editor with font functionality';
  scxSEditRepositoryLabelItem = 'Label|Represents a Label';
  scxSEditRepositoryProgressBarItem = 'ProgressBar|Represents a ProgressBar';
  scxSEditRepositoryTrackBarItem = 'TrackBar|Represents a TrackBar';
  scxSEditRepositorySpinButtonItem = 'SpinButton|Represents a SpinButton';
  scxSEditRepositoryCheckComboBox = 'CheckComboBox|Represents a CheckComboBox';
  scxSEditRepositoryShellComboBoxItem = 'ShellComboBox|Represents a combo box with a dropdown shell tree view';
  scxSEditRepositoryCheckGroupItem = 'CheckGroup|Represents a group of check boxes';
  scxSEditRepositoryRatingControlItem = 'RatingControl|Represents a rating control';
  scxUDAssociated = ' is already associated with ';
  scxHotZoneStyleMediaPlayer9 = 'MediaPlayer9';
  scxHotZoneStyleMediaPlayer8 = 'MediaPlayer8';
  scxHotZoneStyleXPTaskBar = 'XPTaskBar';
  scxHotZoneStyleSimple = 'Simple';
  scxLoadingFonts = 'Loading ...';

  cxSEditCheckGroupCaptionStateDelimiter = ': ';
  cxSEditCheckGroupFilterColumnSeparator = '; ';
  cxSEditCheckGroupChecked = 'Checked';
  cxSEditCheckGroupGrayed = 'Grayed';
  cxSEditCheckGroupUnchecked = 'Unchecked';

  cxSCheckComboBoxStatesItemsPropertyDlgCaption = 'cxCheckComboBox - CheckStates editor';
  cxSCheckGroupStatesItemsPropertyDlgCaption = 'cxCheckGroup - CheckStates editor';
  cxSCheckComboBoxEmptySelectionText = 'None selected';
  cxSCheckControlIncorrectItemCount = 'The number of items cannot be greater than 64, if the EditValueFormat is cvfInteger';

  cxSColorComboBoxDefaultDescription = 'Color not selected';

  cxSEditRichEditLibraryError = 'Cannot load a RichEdit library';
  cxSEditRichEditLineInsertionError = 'RichEdit line insertion error';
  cxSEditRichEditLoadFail = 'Failed to Load Stream';
  cxSEditRichEditSaveFail = 'Failed to Save Stream';
  cxSEditRichEditSelectionSaveFail = 'Failed to selection Save Stream';
  cxSEditRichEditOleInterfaceFail = 'RichEdit: failed to get IRichEditOle interface';
  cxSEditRichEditCallBackFail = 'RichEdit: failed to set callback';
  cxSEditRichEditLinkFail = 'RichEdit: cannot link to an invalid source';
  scxSEditRepositoryRichEditItem = 'RichEdit|RichEdit control';

  cxSEditRichEditUndoCaption                 = '&Undo';
  cxSEditRichEditRedoCaption                 = '&Redo';
  cxSEditRichEditCutCaption                  = 'Cu&t';
  cxSEditRichEditCopyCaption                 = '&Copy';
  cxSEditRichEditPasteCaption                = '&Paste';
  cxSEditRichEditDeleteCaption               = '&Delete';
  cxSEditRichEditSelectAllCaption            = 'Select &All';    }
end;

procedure InitializeUnit_cxLibraryStrs;
begin
  cxSetResourceString(@scxBuiltInLookAndFeelStyles , 'Built-In вид && Стили' );
  cxSetResourceString(@scxCantCreateRegistryKey , 'Не могу создать ключ реестра \%s' );
  cxSetResourceString(@scxCantOpenRegistryKey   , 'Не могу открыть ключ реестра: \%s' );
  cxSetResourceString(@scxConverterCantCreateStyleRepository , 'Не могу создать репозиторий стилей' );
  cxSetResourceString(@scxErrorStoreObject , 'Ошибка %s объекта' );
  cxSetResourceString(@scxLockedStateText , 'Пожалуйста ждите...' );

  // date smart input consts
  cxSetResourceString(@cxSDateToday                       , 'сегодня' );
  cxSetResourceString(@cxSDateYesterday                   , 'вчера' );
  cxSetResourceString(@cxSDateTomorrow                    , 'завтра' );
  cxSetResourceString(@cxSDateSunday                      , 'Воскресенье' );
  cxSetResourceString(@cxSDateMonday                      , 'Понедельник' );
  cxSetResourceString(@cxSDateTuesday                     , 'Вторник' );
  cxSetResourceString(@cxSDateWednesday                   , 'Среда' );
  cxSetResourceString(@cxSDateThursday                    , 'Четверг' );
  cxSetResourceString(@cxSDateFriday                      , 'Пятница' );
  cxSetResourceString(@cxSDateSaturday                    , 'Суббота' );
  cxSetResourceString(@cxSDateFirst                       , 'первый' );
  cxSetResourceString(@cxSDateSecond                      , 'второй' );
  cxSetResourceString(@cxSDateThird                       , 'третий' );
  cxSetResourceString(@cxSDateFourth                      , 'четвертый' );
  cxSetResourceString(@cxSDateFifth                       , 'пятый' );
  cxSetResourceString(@cxSDateSixth                       , 'шестой' );
  cxSetResourceString(@cxSDateSeventh                     , 'седьмой' );
  cxSetResourceString(@cxSDateBOM                         , 'bom' );
  cxSetResourceString(@cxSDateEOM                         , 'eom' );
  cxSetResourceString(@cxSDateNow                         , 'сейчас' );
end;

procedure InitializeLocale;
begin
  InitializeUnit_cxGridStrs;
  InitializeUnit_cxGridPopupMenuConsts;
  InitializeUnit_dxBarStrs;
  InitializeUnit_cxFilterControlStrs;
  InitializeUnit_cxFilterConsts;
  InitializeUnit_cxDataConsts;
  InitializeUnit_cxEditConsts;
  InitializeUnit_cxSchedulerStrs;
  InitializeUnit_cxExtEditConsts;
  InitializeUnit_cxLibraryStrs;
end;

initialization
  InitializeLocale;

end.
