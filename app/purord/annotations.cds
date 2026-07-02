//using CatalogService as service from '../../srv/CatalogService';


using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields          : [
        PO_ID,
        GROSS_AMOUNT,
        Supplier,
        LIFECYCLE_STATUS,
        CURRENCY_code,
        PARTNER_GUID_NODE_KEY
    ],
    UI.LineItem                 : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type                    : 'UI.DataField',
            Value                    : OVERALL_STATUS,
            Criticality              : Criticality,
            CriticalityRepresentation: #OnlyIcon
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Boost',
            Action: 'CatalogService.boost',
            Inline: true,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type: 'UI.DataField',
            Value: CURRENCY_code
        },
        {
            $Type: 'UI.DataField',
            Value: TAX_AMOUNT
        }
    ],
    UI.HeaderInfo               : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Purchase Orders',
        TypeNamePlural: 'Purchase Orders',
        Title         : {
            Label: 'PurchaseOrder ID',
            Value: PO_ID
        },
        Description   : {
            Label: 'Supplier',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl      : 'data:image/png;base64,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'
    },
    UI.Facets                   : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Details',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Details',
                    Target: ![@UI.FieldGroup#SathwikFields]
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '   Amounts',
                    Target: ![@UI.FieldGroup#SecondGroup]
                }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Line Items',
            Target: Items.![@UI.LineItem],
        }

    ],

    UI.FieldGroup #SecondGroup  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PO_ID
            },
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: CURRENCY_code
            }
        ]
    },


    UI.FieldGroup #SathwikFields: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PO_ID
            },
            {
                $Type: 'UI.DataField',
                Value: PARTNER_GUID_NODE_KEY
            },
            {
                $Type: 'UI.DataField',
                Value: PARTNER_GUID.BP_ID
            },
            {
                $Type: 'UI.DataField',
                Value: PARTNER_GUID.COMPANY_NAME
            },
            {
                $Type: 'UI.DataField',
                Value: LIFECYCLE_STATUS
            }
        ]
    }
);


annotate CatalogService.POs with {
    PARTNER_GUID @(
        Common.Text     : PARTNER_GUID.COMPANY_NAME,

        Common.ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'BusinessPartnerSet',

            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: PARTNER_GUID_NODE_KEY,
                    ValueListProperty: 'NODE_KEY'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'COMPANY_NAME'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'BP_ID'
                }
            ]
        }
    );
};

annotate CatalogService.PurchaseOrderItems with {

    PRODUCT_GUID @( //  use _ID (foreign key)
        Common.Text           : PRODUCT_GUID.DESCRIPTION, // no quotes
        Common.TextArrangement: #TextFirst,

        Common.ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ProductSet',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: PRODUCT_GUID,
                    ValueListProperty: 'NODE_KEY'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'DESCRIPTION'
                }
            ]
        }
    );

};


annotate CatalogService.PurchaseOrderItems with @(UI: {
    LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },
        {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: NET_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: TAX_AMOUNT,
        },
        {
            $Type: 'UI.DataField',
            Value: CURRENCY_code,
        },
    ],

    HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: NODE_KEY
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS
        }
    },

    Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'More Info',
            Target: '@UI.FieldGroup#LineItemHeader'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Info',
            Target: '@UI.FieldGroup#ProductDetails'
        }

    ],
    FieldGroup #LineItemHeader: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PO_ITEM_POS,
            },
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value: CURRENCY_code,
            },
        ]

    },
    FieldGroup #ProductDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_GUID.PRODUCT_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_GUID.DESCRIPTION,
            },
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_GUID.CATEGORY,
            },
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME,
            },
            {
                $Type: 'UI.DataField',
                Value: PRODUCT_GUID.TAX_TARIF_CODE,
            },
        ]
    },

})
