namespace sathwik.common;  // called as aspects in case of cds
using { Currency } from '@sap/cds/common';


type Guid: String(32); //use in entire project, decleared as global

type Gender: String(1) enum{
    male = 'M';
    female = 'F';
    unDisclosed = 'U';
};

type AmountT : Decimal(10,2) @(
    Semantics.amount.curryencyCode : 'CURRENCY_CODE',
    sap.unit : 'CURRENCY_CODE'
);

aspect Amount : {
    CURRENCY : Currency;
    GROSS_AMOUNT : AmountT @title : '{i18n>GrossAmount}';
    NET_AMOUNT : AmountT @title : '{i18n>NetAmount}';
    TAX_AMOUNT : AmountT @title : '{i18n>TaxAmount}';
}

type PhoneNumber : String(10)
  @assert.format: '^\d{10}$';

type Email : String(255)
  @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

