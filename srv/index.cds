using {
    sathwik.db.master,
    sathwik.db.transaction
} from '../db/datamodel';
using { CatalogService } from './CatalogService';


annotate master.businesspartner with {
     NODE_KEY @title : '{i18n>bp_key}';
     BP_ID @title : '{i18n>bp_id}';
     COMPANY_NAME @title : '{i18n>company_name}'
};

annotate master.product with {
     NODE_KEY @title : '{i18n>product_key}';
     PRODUCT_ID @title : '{i18n>product_guid}';
     DESCRIPTION @title : '{i18n>name}'
};

annotate transaction.purchaseorder with {
    NODE_KEY     @title: '{i18n>po_node_key}';
    PO_ID @title:'{i18n>po_id}';
    PARTNER_GUID @title:'{i18n>partner_guid}';
    LIFECYCLE_STATUS @title:'{i18n>overall_status}';
    OVERALL_STATUS @title:'{i18n>overall_status}';
    NOTE @title: 'Notes!';
    CURRENCY     @title: '{i18n>currency_code}';
    GROSS_AMOUNT @title: '{i18n>gross_amount}';
    NET_AMOUNT   @title: '{i18n>net_amount}';
    TAX_AMOUNT   @title: '{i18n>tax_amount}';
    Items @title:'{i18n}';
};


annotate transaction.poitems with {
    NODE_KEY        @title: '{i18n>po_node_key}';
    PARENT_KEY      @title: '{i18n>po_node_key}';
    PO_ITEM_POS     @title: '{i18n>po_item_pos}';
    PRODUCT_GUID    @title: '{i18n>product_guid}';
    //OVERALL_STATUS @title:'{i18n>overall_status}';
    CURRENCY     @title: '{i18n>currency_code}';
    GROSS_AMOUNT @title: '{i18n>gross_amount}';
    NET_AMOUNT   @title: '{i18n>net_amount}';
    TAX_AMOUNT   @title: '{i18n>tax_amount}';
};

annotate CatalogService.POs with {

    PO_ID          @title: '{i18n>po_id}';
    GROSS_AMOUNT   @title: '{i18n>gross_amount}';
    OVERALL_STATUS @title: '{i18n>overall_status}';
    PARTNER_GUID   @title: '{i18n>supplier_name}';

};



