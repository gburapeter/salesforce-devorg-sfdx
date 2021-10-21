/**
 * Created by pbura on 10/21/2021.
 */

({
     doInit : function(component, event, helper) {

           const actions = [
                                {label: 'Accept Webinar', name: 'acceptWebinar'},
                                {'label' : 'Reject Webinar', 'name' : 'rejectWebinar'}
                            ];


            component.set("v.columns", [
                {'label' : 'Name', 'fieldName': 'Name', 'type' : 'text'},
                {'label' : 'Approval status', 'fieldName': 'Approval_Status__c', type: 'text'},
                {'label' : 'Cost', 'fieldName': 'Cost__c', type: 'text'},
                {type: 'action', typeAttributes: {rowActions: actions}}
            ]);
            // helper function called
            helper.doInit(component, helper);
        },

        onRowActions : function(component, event, helper) {
            var action = event.getParam('action');
            var row = event.getParam('row');
            switch (action.name) {
                case 'acceptWebinar':
                 helper.showAcceptedPage(component, helper, row);


                    break;
                case 'rejectWebinar':
                 helper.showRejectedPage(component, helper, row);
                    console.log("Rejected");
                    break;
            }
        },

        handleRefusal : function(component, event, helper) {
              helper.updateStatus(component, helper, row);

        },
        closeRefusal : function(component, event, helper) {
            console.log("Closerefusal controller");
            helper.hideRejectedPage(component);
        }
});