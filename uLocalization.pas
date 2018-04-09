unit uLocalization;

interface

implementation

uses dxCore, cxGridStrs, cxGridPopupMenuConsts, dxBarStrs, cxFilterControlStrs, cxFilterConsts,
    cxDataConsts, cxEditConsts, cxExtEditConsts, cxLibraryStrs, cxSchedulerStrs;

procedure InitializeUnit_cxGridStrs;
begin
  cxSetResourceString(@scxGridRecursiveLevels, '�� �� ������ ������� ����������� ������' );

  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, '������� ������?' );
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, '������� ��� ���������� ������?' );

  cxSetResourceString(@scxGridNoDataInfoText, '��� ������ ��� �����������' );

  cxSetResourceString(@scxGridFilterRowInfoText, '������ ��� �������� ��������' );
  cxSetResourceString(@scxGridNewItemRowInfoText, '������ ��� ���������� ������' );

  cxSetResourceString(@scxGridFindPanelClearButtonCaption , '��������' );
  cxSetResourceString(@scxGridFindPanelFindButtonCaption , '�����' );
  cxSetResourceString(@scxGridFindPanelInfoText , '������� �����, ������� ���� �����...' );

  cxSetResourceString(@scxGridFilterIsEmpty, '<������ ����>' );

  cxSetResourceString(@scxGridCustomizationFormCaption, '���������' );
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, '�������' );
  cxSetResourceString(@scxGridGroupByBoxCaption, '���������� ��������� ������� �� ��� ����...');
  cxSetResourceString(@scxGridFilterApplyButtonCaption, '��������� ������' );
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, '���������...' );
  cxSetResourceString(@scxGridColumnsQuickCustomizationHint, '�������� �����, ����� ��������\������\���������� �������');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, '�����' );
  cxSetResourceString(@scxGridBandsQuickCustomizationHint, '�������� �����, ����� ��������\������\���������� �������' );

  cxSetResourceString(@scxGridCustomizationFormRowsPageCaption, '������' );

  cxSetResourceString(@scxGridConverterIntermediaryMissing, '���������� ������������� ���������!'#13#10'����������, �������� %s ��������� �� �����.' );
  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid �� ����������' );
  cxSetResourceString(@scxGridConverterNotExistComponent, '��������� �� ����������' );
  cxSetResourceString(@scxImportErrorCaption, '������ �������' );

  cxSetResourceString(@scxNotExistGridView, 'Grid view �� ����������' );

  cxSetResourceString(@cxSEditRepositoryExtLookupComboBoxItem, 'ExtLookupComboBox|������������ ������-������������ ����������� ������ c �������������� QuantumGrid' );

  // date ranges

  cxSetResourceString(@scxGridYesterday , '�����' );
  cxSetResourceString(@scxGridToday , '�������' );
  cxSetResourceString(@scxGridTomorrow , '������' );
  cxSetResourceString(@scxGridLast30Days , '��������� 30 ����' );
  cxSetResourceString(@scxGridLast14Days , '��������� 14 ����' );
  cxSetResourceString(@scxGridLast7Days , '��������� 7 ����' );
  cxSetResourceString(@scxGridNext7Days , '��������� 7 ����' );
  cxSetResourceString(@scxGridNext14Days , '��������� 14 ����' );
  cxSetResourceString(@scxGridNext30Days , '��������� 30 ����' );
  cxSetResourceString(@scxGridLastTwoWeeks , '��������� ��� ������' );
  cxSetResourceString(@scxGridLastWeek , '��������� ������' );
  cxSetResourceString(@scxGridThisWeek , '��� ������' );
  cxSetResourceString(@scxGridNextWeek , '��������� ������' );
  cxSetResourceString(@scxGridNextTwoWeeks , '��������� ��� ������' );
  cxSetResourceString(@scxGridLastMonth , '��������� �����' );
  cxSetResourceString(@scxGridThisMonth , '���� �����' );
  cxSetResourceString(@scxGridNextMonth , '��������� �����' );
  cxSetResourceString(@scxGridLastYear , '��������� ���' );
  cxSetResourceString(@scxGridThisYear , '���� ���' );
  cxSetResourceString(@scxGridNextYear , '��������� ���' );
  cxSetResourceString(@scxGridPast , '� �������' );
  cxSetResourceString(@scxGridFuture , '� �������' );

  cxSetResourceString(@scxGridMonthFormat , 'mmmm yyyy' );
  cxSetResourceString(@scxGridYearFormat , 'yyyy' );

  // ChartView

  cxSetResourceString(@scxGridChartCategoriesDisplayText, '������' );

  cxSetResourceString(@scxGridChartValueHintFormat , '%s ��� %s ��� %s' );  // series display text, category, value
  cxSetResourceString(@scxGridChartPercentValueTickMarkLabelFormat , '0%' );

  cxSetResourceString(@scxGridChartToolBoxDataLevels , '������ ������:' );
  cxSetResourceString(@scxGridChartToolBoxDataLevelSelectValue , '�������� ��������' );
  cxSetResourceString(@scxGridChartToolBoxCustomizeButtonCaption , '��������� �����' );

  cxSetResourceString(@scxGridChartNoneDiagramDisplayText , '��� ���������' );
  cxSetResourceString(@scxGridChartColumnDiagramDisplayText , 'Column-���������' );
  cxSetResourceString(@scxGridChartBarDiagramDisplayText , '���-���������' );
  cxSetResourceString(@scxGridChartLineDiagramDisplayText , 'Line-���������' );
  cxSetResourceString(@scxGridChartAreaDiagramDisplayText , 'Area-���������' );
  cxSetResourceString(@scxGridChartPieDiagramDisplayText , 'Pie-���������' );
  cxSetResourceString(@scxGridChartStackedBarDiagramDisplayText , 'Stacked Bars-���������' );
  cxSetResourceString(@scxGridChartStackedColumnDiagramDisplayText , 'Stacked Columns-���������' );
  cxSetResourceString(@scxGridChartStackedAreaDiagramDisplayText , 'Stacked Area-���������' );

  cxSetResourceString(@scxGridChartCustomizationFormSeriesPageCaption , '�����' );
  cxSetResourceString(@scxGridChartCustomizationFormSortBySeries , '�����������:' );
  cxSetResourceString(@scxGridChartCustomizationFormNoSortedSeries , '<��� �����>' );
  cxSetResourceString(@scxGridChartCustomizationFormDataGroupsPageCaption , '������ ������' );
  cxSetResourceString(@scxGridChartCustomizationFormOptionsPageCaption , '�����' );

  cxSetResourceString(@scxGridChartLegend , '�������' );
  cxSetResourceString(@scxGridChartLegendKeyBorder , 'Key Border' );
  cxSetResourceString(@scxGridChartPosition , '�������' );
  cxSetResourceString(@scxGridChartPositionDefault , '�� ���������' );
  cxSetResourceString(@scxGridChartPositionNone , '���' );
  cxSetResourceString(@scxGridChartPositionLeft , '�����' );
  cxSetResourceString(@scxGridChartPositionTop , '������' );
  cxSetResourceString(@scxGridChartPositionRight , '������' );
  cxSetResourceString(@scxGridChartPositionBottom , '�����' );
  cxSetResourceString(@scxGridChartAlignment , '������������' );
  cxSetResourceString(@scxGridChartAlignmentDefault , '�� ���������' );
  cxSetResourceString(@scxGridChartAlignmentStart , '������' );
  cxSetResourceString(@scxGridChartAlignmentCenter , '�����' );
  cxSetResourceString(@scxGridChartAlignmentEnd , '�����' );
  cxSetResourceString(@scxGridChartOrientation , '����������' );
  cxSetResourceString(@scxGridChartOrientationDefault , '�� ���������' );
  cxSetResourceString(@scxGridChartOrientationHorizontal , '��������������' );
  cxSetResourceString(@scxGridChartOrientationVertical , '������������' );
  cxSetResourceString(@scxGridChartBorder , '����' );
  cxSetResourceString(@scxGridChartTitle , '���������' );
  cxSetResourceString(@scxGridChartToolBox , 'ToolBox' );
  cxSetResourceString(@scxGridChartDiagramSelector , '����� ���������' );
  cxSetResourceString(@scxGridChartOther , '������' );
  cxSetResourceString(@scxGridChartValueHints , '��������� ��������' );

  cxSetResourceString( @scxGridLayoutViewCustomizeFormOk, 'OK' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormCancel, '������' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormApply, '���������' );
  cxSetResourceString( @scxGridLayoutViewCustomizeWarningDialogCaption, '��������' );
  cxSetResourceString( @scxGridLayoutViewCustomizeWarningDialogMessage, 'Layout ��������. �� ������ ��������� ���������?' );
  cxSetResourceString( @scxGridLayoutViewCustomizeLayoutButtonCaption, '�������� Layout' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormTemplateCard, '����� �������' );
  cxSetResourceString( @scxGridLayoutViewCustomizeFormViewLayout, '�������� Layout' );
  cxSetResourceString(@scxGridLayoutViewRecordCaptionDefaultMask, '������: [RecordIndex]/[RecordCount]' );

  cxSetResourceString(@scxGridLockedStateImageText, '����������, �����...' );

  cxSetResourceString(@scxGridInplaceEditFormButtonCancel, '������' );
  cxSetResourceString(@scxGridInplaceEditFormButtonClose, 'Close' );
  cxSetResourceString(@scxGridInplaceEditFormButtonUpdate, '��������' );
  cxSetResourceString(@scxGridInplaceEditFormSaveChangesQuery, '������ ���� ��������. �� ������ ��������� ���������?' );
end;

procedure InitializeUnit_cxGridPopupMenuConsts;
begin
  cxSetResourceString(@cxSGridNone , '���' );

  // Header popup menu item captions

  cxSetResourceString(@cxSGridSortColumnAsc , '���������� ����������' );
  cxSetResourceString(@cxSGridSortColumnDesc , '���������� ����������' );
  cxSetResourceString(@cxSGridClearSorting , '�������� ����������' );
  cxSetResourceString(@cxSGridGroupByThisField , '������������ �� ����� ����' );
  cxSetResourceString(@cxSGridRemoveThisGroupItem , '������� �� �����������' );
  cxSetResourceString(@cxSGridGroupByBox , '���� �����������' );
  cxSetResourceString(@cxSGridAlignmentSubMenu , '������������' );
  cxSetResourceString(@cxSGridAlignLeft , '����������� �����' );
  cxSetResourceString(@cxSGridAlignRight , '����������� ������' );
  cxSetResourceString(@cxSGridAlignCenter , '����������� �� ������' );
  cxSetResourceString(@cxSGridRemoveColumn , '������� ���� �������' );
  cxSetResourceString(@cxSGridFieldChooser , '������� ����' );
  cxSetResourceString(@cxSGridBestFit , '������ ������������' );
  cxSetResourceString(@cxSGridBestFitAllColumns , '������ ������������ (��� �������)' );
  cxSetResourceString(@cxSGridShowFooter , '����������' );
  cxSetResourceString(@cxSGridShowGroupFooter , '����������� ������������' );
  cxSetResourceString(@cxSGridShowFindPanel , '����� ������' );
  cxSetResourceString(@cxSGridFullExpand , '��������� ����������' );
  cxSetResourceString(@cxSGridFullCollapse , '��������� ��������' );
  cxSetResourceString(@cxSGridClearGrouping , '�������� �����������' );
  cxSetResourceString(@cxSGridHideGroupByBox , '������ ���� �����������' );

  // Footer popup menu item captions

  cxSetResourceString(@cxSGridNoneMenuItem , '���' );
  cxSetResourceString(@cxSGridSumMenuItem , '�����' );
  cxSetResourceString(@cxSGridMinMenuItem , '���' );
  cxSetResourceString(@cxSGridMaxMenuItem , '����' );
  cxSetResourceString(@cxSGridCountMenuItem , '���-��' );
  cxSetResourceString(@cxSGridAvgMenuItem , '�������' );

  // Group row popup menu item captions

  cxSetResourceString(@cxSGridSortByGroupValues, '������������ �� �������� �����������' );
  cxSetResourceString(@cxSGridSortBySummaryCaption, '����������� �� ����� �����������:' );
  cxSetResourceString(@cxSGridSortBySummary, '%s ��� %s' );
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
end;

procedure InitializeUnit_cxFilterControlStrs;
begin
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

  // FilterControlDialog
  cxSetResourceString(@cxSFilterControlDialogCaption , '��������� �������' );
  cxSetResourceString(@cxSFilterControlDialogNewFile , '����������.flt' );
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption , '������� ������������ ������' );
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption , '��������� �������� ������ � ����' );
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&��������� ���...' );
  cxSetResourceString(@cxSFilterControlDialogActionSaveHint , '��������� ���|��������� �������� ������ � ����� ������' );
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&�������...' );
  cxSetResourceString(@cxSFilterControlDialogActionOpenHint , '�������|������� ������������ ������' );
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , '&���������' );
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption , 'OK' );
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption , '������' );
  cxSetResourceString(@cxSFilterControlDialogFileExt , 'flt' );
  cxSetResourceString(@cxSFilterControlDialogFileFilter , '������� (*.flt)|*.flt' );
end;

procedure InitializeUnit_cxFilterConsts;
begin
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
end;

procedure InitializeUnit_cxDataConsts;
begin
  cxSetResourceString(@cxSDataReadError , '������ ������ ������' );
  cxSetResourceString(@cxSDataWriteError , '������ ������ ������' );
  cxSetResourceString(@cxSDataItemExistError , '����� ��� ����������' );
  cxSetResourceString(@cxSDataRecordIndexError , 'RecordIndex out of range' );
  cxSetResourceString(@cxSDataItemIndexError , 'ItemIndex out of range' );
  cxSetResourceString(@cxSDataProviderModeError , '��� �������� �� �������������� � provider mode' );
  cxSetResourceString(@cxSDataInvalidStreamFormat , '�������� ������ ������' );
  cxSetResourceString(@cxSDataRowIndexError , 'RowIndex out of range' );
  cxSetResourceString(@cxSDataCustomDataSourceInvalidCompare , 'GetInfoForCompare not implemented' );
  // DB
  cxSetResourceString(@cxSDBDetailFilterControllerNotFound , 'DetailFilterController �� ������' );
  cxSetResourceString(@cxSDBNotInGridMode , 'DataController �� � GridMode' );
  cxSetResourceString(@cxSDBKeyFieldNotFound , '�������� ���� �� �������' );
end;

procedure InitializeUnit_cxEditConsts;
begin
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

procedure InitializeUnit_cxSchedulerStrs;
begin
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
  cxSetResourceString(@scxLocation          , '&�����:' );
  cxSetResourceString(@scxLabelAs           , '����� ���:' );
  cxSetResourceString(@scxLabel             , '��&���:' );
  cxSetResourceString(@scxStartTime         , '����� &������:' );
  cxSetResourceString(@scxEndTime           , '����� &�����:' );
  cxSetResourceString(@scxAllDayEvent       , '&������������� ������� ' );
  cxSetResourceString(@scxRecurrenceLabel   , '�������������:' );

  cxSetResourceString(@scxReminder          , '����������:' );
  cxSetResourceString(@scxShowTimeAs        , '�����:' );
  cxSetResourceString(@scxShowAs            , '�������� ���:' );

  cxSetResourceString(@scxSuffixMinute      , '������' );
  cxSetResourceString(@scxSuffixMinutes     , '������' );
  cxSetResourceString(@scxSuffixHour        , '���' );
  cxSetResourceString(@scxSuffixHours       , '����' );
  cxSetResourceString(@scxSuffixDay         , '����' );
  cxSetResourceString(@scxSuffixDays        , '���' );
  cxSetResourceString(@scxSuffixWeek        , '������' );
  cxSetResourceString(@scxSuffixWeeks       , '������' );

  cxSetResourceString(@scxBusy              , '�����' );
  cxSetResourceString(@scxFree              , '��������' );
  cxSetResourceString(@scxTentative         , '��������������' );
  cxSetResourceString(@scxOutOfOffice       , '�� � �����' );

  cxSetResourceString(@scxRecurrenceCaption         , '������������� �������' );
  cxSetResourceString(@scxRecurrenceHolidayCaption  , '��������������� ���������' );

  cxSetResourceString(@scxEventTime         , ' ����� ������� ' );
  cxSetResourceString(@scxRecurrencePattern , ' ������ ������� ' );
  cxSetResourceString(@scxRangeOfRecurrence , ' ������������ ������� ' );
  cxSetResourceString(@scxStart             , '&������:' );
  cxSetResourceString(@scxStart1            , '�&�����:' );
  cxSetResourceString(@scxEnd               , '&�����:' );
  cxSetResourceString(@scxDuration          , '�&����������������:' );
  // Pattern
  cxSetResourceString(@scxDaily             , '&���������' );
  cxSetResourceString(@scxWeekly            , '&�����������' );
  cxSetResourceString(@scxQuarterly         , '&�������������' );
  cxSetResourceString(@scxMonthly           , '&����������' );
  cxSetResourceString(@scxYearly            , '&��������' );
  // daily
  cxSetResourceString(@scxEvery             , '�&�����' );
  cxSetResourceString(@scxEveryWeekDay      , '������ ���� ������' );
  cxSetResourceString(@scxDays              , '����(���)' );
  // weekly
  cxSetResourceString(@scxWeeksOn           , '������ �:' );
  cxSetResourceString(@scxRecurEvery        , '��������� ������' );
  //monthly
  cxSetResourceString(@scxOfEvery           , '�������' );
  cxSetResourceString(@scxMonths            , '�����(�)' );
  // yearly
  cxSetResourceString(@scxThe               , '����' );
  cxSetResourceString(@scxOf                , '�' ); // of

  // Task links

  cxSetResourceString(@scxTaskComplete                   , '������ ���������:' );
  cxSetResourceString(@scxTaskStatus                     , '������ ������' );
  cxSetResourceString(@scxTaskDependencyEditorCaption    , '����������� ������' );
  cxSetResourceString(@scxTaskWrongTimeBounds            , '����� ���� ������ ���� ������ ������� %s - %s.' );
  cxSetResourceString(@scxFinishToFinishLong   , '�����-����� (��)' );
  cxSetResourceString(@scxFinishToStartLong    , '�����-������ (��)' );
  cxSetResourceString(@scxFrom                 , '��:' );
  cxSetResourceString(@scxStartToFinishLong    , '������-����� (��)' );
  cxSetResourceString(@scxStartToStartLong     , '������-������ (��)' );
  cxSetResourceString(@scxTo                   , '�:' );
  cxSetResourceString(@scxType                 , '&���:' );

  // other
  cxSetResourceString(@scxFirst             , '������' );
  cxSetResourceString(@scxSecond            , '������' );
  cxSetResourceString(@scxThird             , '������' );
  cxSetResourceString(@scxFourth            , '���������' );
  cxSetResourceString(@scxLast              , '���������' );
  cxSetResourceString(@scxDay               , '����' );
  cxSetResourceString(@scxDay1              , '����' );
  cxSetResourceString(@scxWeekday           , '���� ������' );
  cxSetResourceString(@scxWeekendday        , '��������' );
  cxSetResourceString(@scxNoEndDate         , '&��� �����' );
  cxSetResourceString(@scxEndAfter          , '��������� �����:' );
  cxSetResourceString(@scxEndBy             , '��������� �:' );
  cxSetResourceString(@scxOccurences        , '������' );

  // buttons
  cxSetResourceString(@scxAdd1              , '��������' );
  cxSetResourceString(@scxAdd1Hint          , '�������� (Ins)' );
  cxSetResourceString(@scxEditDotted        , '�������������...' );
  cxSetResourceString(@scxApply             , '&���������' );
  cxSetResourceString(@scxFindAvailableTime , '����� ��������� �����' );
  cxSetResourceString(@scxOk                , '&OK' );
  cxSetResourceString(@scxSaveAndClose      , '��������� && �������' );
  cxSetResourceString(@scxSaveAndCloseHint  , '��������� & �������' );
  cxSetResourceString(@scxSave              , '���������' );
  cxSetResourceString(@scxCancel            , '&������' );
  cxSetResourceString(@scxClose             , '&�������' );
  cxSetResourceString(@scxActionClose       , '�������' );
  cxSetResourceString(@scxDown              , '&����' );
  cxSetResourceString(@scxDelete1           , '�������' );
  cxSetResourceString(@scxDelete1Hint       , '������� (Del)' );
  cxSetResourceString(@scxEdit1             , '�������������' );
  cxSetResourceString(@scxImport            , '&������' );
  cxSetResourceString(@scxExport            , '&�������' );
  cxSetResourceString(@scxImportHint        , '������' );
  cxSetResourceString(@scxExportHint        , '�������' );
  cxSetResourceString(@scxRemoveRecur       , '&������ �������������' );
  cxSetResourceString(@scxSelectAll         , '�������� &���' );
  cxSetResourceString(@scxSelectNone        , '������ ���������' );
  cxSetResourceString(@scxUp                , '&�����' );
  //
  cxSetResourceString(@scxResourceLayoutCaption , '�������� ��������� ��������' );

  // popup menu resources
  cxSetResourceString(@scxpmNewEvent          , '&����� �������' );
  cxSetResourceString(@scxpmNewAllDayEvent    , '����� ����������� �������' );
  cxSetResourceString(@scxpmNewRecurringEvent , '����� ������������� �������' );
  cxSetResourceString(@scxpmToday             , '�������' );
  cxSetResourceString(@scxpmGotoThisDay       , '������� � ����� ���' );
  cxSetResourceString(@scxpmGoToDate          , '������� � ����...' );
  cxSetResourceString(@scxpmResourcesLayout   , '�������� ��������� ��������...' );

  // for event
  cxSetResourceString(@scxpmOpen              , '&�������' );
  cxSetResourceString(@scxpmEditSeries        , '������� �����' );
  cxSetResourceString(@scxpmShowTimeAs        , '�������� �����' );
  cxSetResourceString(@scxpmDelete            , '&�������' );
  cxSetResourceString(@scxpmFree              , '&��������' );
  cxSetResourceString(@scxpmTentative         , '&�����������' );
  cxSetResourceString(@scxpmBusy              , '&�����' );
  cxSetResourceString(@scxpmOutOfOffice       , '&�� � �����' );
  cxSetResourceString(@scxpmLabel             , '&�����' );

  // event label captions
  cxSetResourceString(@scxEventLabelNone      , '���' );
  cxSetResourceString(@scxEventLabel0         , '������' );
  cxSetResourceString(@scxEventLabel1         , '������' );
  cxSetResourceString(@scxEventLabel2         , '������' );
  cxSetResourceString(@scxEventLabel3         , '������' );
  cxSetResourceString(@scxEventLabel4         , '������� ��������' );
  cxSetResourceString(@scxEventLabel5         , '��������� ������������' );
  cxSetResourceString(@scxEventLabel6         , '������� ����������' );
  cxSetResourceString(@scxEventLabel7         , '���� ��������' );
  cxSetResourceString(@scxEventLabel8         , '������' );
  cxSetResourceString(@scxEventLabel9         , '���������� ������' );

  // for time ruler menu items
  cxSetResourceString(@scxpmTimeZone          , '�������� ����. ����' );
  cxSetResourceString(@scxpm60Minutes         , '60 �����' );
  cxSetResourceString(@scxpm30Minutes         , '30 �����' );
  cxSetResourceString(@scxpm15Minutes         , '15 �����' );
  cxSetResourceString(@scxpm10Minutes         , '10 �����' );
  cxSetResourceString(@scxpm6Minutes          , '6 �����' );
  cxSetResourceString(@scxpm5Minutes          , '5 �����' );

  // for year view scale menu items
  cxSetResourceString(@scxpmFullYear          , '����� ���' );
  cxSetResourceString(@scxpmHalfYear          , '�������' );
  cxSetResourceString(@scxpmQuarter           , '�������' );

  // year view scales
  cxSetResourceString(@scxFullYear            , '����� ���' );
  cxSetResourceString(@scxHalfYear            , '�������' );
  cxSetResourceString(@scxQuarter             , '�������' );
  cxSetResourceString(@scxHalfYearShort       , '��' );
  cxSetResourceString(@scxQuarterShort        , '��' );

  //navigator hints
  cxSetResourceString(@scxFirstButtonHint     , '������ ��������' );
  cxSetResourceString(@scxPrevPageButtonHint  , '���������� ��������' );
  cxSetResourceString(@scxPrevButtonHint      , '���������� ��������' );
  cxSetResourceString(@scxNextButtonHint      , '��������� ��������' );
  cxSetResourceString(@scxNextPageButtonHint  , '��������� ��������' );
  cxSetResourceString(@scxLastButtonHint      , '��������� ��������' );
  cxSetResourceString(@scxShowMoreResourcesButtonHint  , '�������� ������ ����������' );
  cxSetResourceString(@scxShowFewerResourcesButtonHint , '�������� ��������� ����������' );

  //for reminder
  cxSetResourceString(@scxrCaptionReminder  , '�����������' );
  cxSetResourceString(@scxrCaptionReminders , '%d �����������' );
  cxSetResourceString(@scxrDismissButton    , '&���������' );
  cxSetResourceString(@scxrDismissAllButton , '��������� ��' );
  cxSetResourceString(@scxrDueIn            , '��-��' );
  cxSetResourceString(@scxrOpenItemButton   , '&������� �����' );
  cxSetResourceString(@scxrSnoozeButton     , '&��������� �����' );
  cxSetResourceString(@scxrSubject          , '�������' );
  cxSetResourceString(@scxrSnoozeLabel      , '&��������� ��� ���' );
  cxSetResourceString(@scxrSelected         , '%d ����������� �������' );
  cxSetResourceString(@scxrStartTime        , '����� ������: %s' );

  // time
  cxSetResourceString(@scxTime0m     , '0 �����' );
  cxSetResourceString(@scxTime5m     , '5 �����' );
  cxSetResourceString(@scxTime10m    , '10 �����' );
  cxSetResourceString(@scxTime15m    , '15 �����' );
  cxSetResourceString(@scxTime20m    , '20 �����' );
  cxSetResourceString(@scxTime30m    , '30 �����' );
  cxSetResourceString(@scxTime1h     , '1 ���' );
  cxSetResourceString(@scxTime2h     , '2 ����' );
  cxSetResourceString(@scxTime3h     , '3 ����' );
  cxSetResourceString(@scxTime4h     , '4 ����' );
  cxSetResourceString(@scxTime5h     , '5 �����' );
  cxSetResourceString(@scxTime6h     , '6 �����' );
  cxSetResourceString(@scxTime7h     , '7 �����' );
  cxSetResourceString(@scxTime8h     , '8 �����' );
  cxSetResourceString(@scxTime9h     , '9 �����' );
  cxSetResourceString(@scxTime10h    , '10 �����' );
  cxSetResourceString(@scxTime11h    , '11 �����' );
  cxSetResourceString(@scxTime12h    , '12 �����' );
  cxSetResourceString(@scxTime18h    , '18 �����' );
  cxSetResourceString(@scxTime1d     , '1 ����' );
  cxSetResourceString(@scxTime2d     , '2 ���' );
  cxSetResourceString(@scxTime3d     , '3 ���' );
  cxSetResourceString(@scxTime4d     , '4 ���' );
  cxSetResourceString(@scxTime1w     , '1 ������' );
  cxSetResourceString(@scxTime2w     , '2 ������' );
  // advance time
  cxSetResourceString(@scxAdvance0h  , '0 ����� ����� �������' );
  cxSetResourceString(@scxAdvance5m  , '5 ����� ����� �������' );
  cxSetResourceString(@scxAdvance10m , '10 ����� ����� �������' );
  cxSetResourceString(@scxAdvance15m , '15 ����� ����� �������' );

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
  cxSCheckControlIncorrectItemCount = 'The number�of items cannot be greater than 64, if the EditValueFormat is cvfInteger';

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
  cxSetResourceString(@scxBuiltInLookAndFeelStyles , 'Built-In ��� && �����' );
  cxSetResourceString(@scxCantCreateRegistryKey , '�� ���� ������� ���� ������� \%s' );
  cxSetResourceString(@scxCantOpenRegistryKey   , '�� ���� ������� ���� �������: \%s' );
  cxSetResourceString(@scxConverterCantCreateStyleRepository , '�� ���� ������� ����������� ������' );
  cxSetResourceString(@scxErrorStoreObject , '������ %s �������' );
  cxSetResourceString(@scxLockedStateText , '���������� �����...' );

  // date smart input consts
  cxSetResourceString(@cxSDateToday                       , '�������' );
  cxSetResourceString(@cxSDateYesterday                   , '�����' );
  cxSetResourceString(@cxSDateTomorrow                    , '������' );
  cxSetResourceString(@cxSDateSunday                      , '�����������' );
  cxSetResourceString(@cxSDateMonday                      , '�����������' );
  cxSetResourceString(@cxSDateTuesday                     , '�������' );
  cxSetResourceString(@cxSDateWednesday                   , '�����' );
  cxSetResourceString(@cxSDateThursday                    , '�������' );
  cxSetResourceString(@cxSDateFriday                      , '�������' );
  cxSetResourceString(@cxSDateSaturday                    , '�������' );
  cxSetResourceString(@cxSDateFirst                       , '������' );
  cxSetResourceString(@cxSDateSecond                      , '������' );
  cxSetResourceString(@cxSDateThird                       , '������' );
  cxSetResourceString(@cxSDateFourth                      , '���������' );
  cxSetResourceString(@cxSDateFifth                       , '�����' );
  cxSetResourceString(@cxSDateSixth                       , '������' );
  cxSetResourceString(@cxSDateSeventh                     , '�������' );
  cxSetResourceString(@cxSDateBOM                         , 'bom' );
  cxSetResourceString(@cxSDateEOM                         , 'eom' );
  cxSetResourceString(@cxSDateNow                         , '������' );
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
