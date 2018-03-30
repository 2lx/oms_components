	uOMSADOQuery

{$IFDEF COMPONENT_WRAPPER}
	, uOMScxDBImage

	, uOMScxGridViewCommon
	, uOMScxGridDBTableView
	, uOMScxGridDBBandedTableView

	, uOMScxLabel

	, uOMScxSpinEdit
	, uOMScxDBSpinEdit

	, uOMScxCheckBox
	, uOMScxDBCheckBox
	
	, uOMScxComboBox
	, uOMScxLookupComboBox
	, uOMScxDBLookupComboBox
	, uOMScxExtLookupComboBox
	, uOMScxDBExtLookupComboBox

	, uOMScxDBMemo
	
	, uOMScxTextEdit
	, uOMScxDBTextEdit

	, uOMScxDateEdit
	, uOMScxDBDateEdit

	, uOMScxCurrencyEdit
	, uOMScxDBCurrencyEdit
	, uOMSPageControl
	, uOMScxPageControl
	, uOMScxBarEditItem
	, uOMSdxRibbon;
		
type
	TADOQuery 					= class (TOMSADOQuery);

	TcxDBImage 					= class (TOMScxDBImage);

	TcxGridDBTableView 			= class (TOMScxGridDBTableView);
	TcxGridDBBandedTableView 	= class (TOMScxGridDBBandedTableView);

	TcxLabel 					= class (TOMScxLabel);

	TcxSpinEdit 				= class (TOMScxSpinEdit);
	TcxDBSpinEdit 				= class (TOMScxDBSpinEdit);

	TcxCheckBox 				= class (TOMScxCheckBox);
	TcxDBCheckBox 				= class (TOMScxDBCheckBox);
	
	TcxComboBox 				= class (TOMScxComboBox);	
	TcxLookupComboBox 			= class (TOMScxLookupComboBox);
	TcxDBLookupComboBox			= class (TOMScxDBLookupComboBox);
	TcxExtLookupComboBox 		= class (TOMScxExtLookupComboBox);
	TcxDBExtLookupComboBox 		= class (TOMScxDBExtLookupComboBox);
	
	TcxDBMemo					= class (TOMScxDBMemo);
	
	TcxTextEdit 				= class (TOMScxTextEdit);
	TcxDBTextEdit 				= class (TOMScxDBTextEdit);

	TcxDateEdit 				= class (TOMScxDateEdit);
	TcxDBDateEdit 				= class (TOMScxDBDateEdit);

	TcxCurrencyEdit 			= class (TOMScxCurrencyEdit);
	TcxDBCurrencyEdit 			= class (TOMScxDBCurrencyEdit);

	TPageControl				= class (TOMSPageControl);
	TcxPageControl				= class (TOMScxPageControl);	

	TcxBarEditItem				= class (TOMScxBarEditItem);
	TdxRibbon					= class (TOMSdxRibbon);
{$ELSE}
  	;
{$ENDIF}