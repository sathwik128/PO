sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ns/purord/test/integration/pages/POsList",
	"ns/purord/test/integration/pages/POsObjectPage",
	"ns/purord/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, POsList, POsObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ns/purord') + '/test/flp.html#app-preview',
        pages: {
			onThePOsList: POsList,
			onThePOsObjectPage: POsObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

