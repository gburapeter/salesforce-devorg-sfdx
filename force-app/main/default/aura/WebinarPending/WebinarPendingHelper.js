/**
 * Created by pbura on 10/21/2021.
 */

({
     doInit : function(component, helper) {
            // Apex function usage
            const getWebinars = component.get("c.getWebinars");
            getWebinars.setParams({
                queryLimit: component.get("v.webinarsLimit")
            });
            getWebinars.setCallback(this, function(response) {
                if (response.getState() === 'SUCCESS') {
                    component.set("v.webinars", response.getReturnValue());

                    component.set("v.webinarCost", response.getReturnValue().Cost__c)
                }
                else {
                    console.log('Something went wrong');
                }
            });
            $A.enqueueAction(getWebinars);
            // End of apex function call
        },

         showAcceptedPage : function(component, helper, row) {
            component.set("v.acceptedWebinar", true);
             },

              hideAcceptedPage : function(component, helper, row) {
                         component.set("v.acceptedWebinar", false);
                          },


         showRejectedPage:  function(component) {
              component.set("v.rejectedWebinar", true);
        },

         hideRejectedPage:  function(component) {
            console.log("helper rejecting");
            component.set("v.rejectedWebinar", false);
         },

         updateStatus : function(component, helper, row){

         }

});