({
      // Load expenses from Salesforce
      doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    createItem : function(component, event, helper){
        
        helper.validateFields (component,component.find("name"));
        helper.validateFields (component,component.find("Price"));
        helper.validateFields (component,component.find("Quantity"));
        if(component.get("v.er") === false)
        {     
            var Item = component.get("v.newItem");            
            helper.createItem (component,Item);             
                       
        }
	}    
    // clickCreateItem: function(component, event, helper) {
    //     let validCampingItem = component.find('campingitemform').reduce(function (validSoFar, inputCmp) {
    //         // Displays error messages for invalid fields
    //         inputCmp.showHelpMessageIfInvalid();
    //         return validSoFar && inputCmp.get('v.validity').valid;
    //     }, true);
    //     // If we pass error checking, do some real work
    //     if(validCampingItem){
    //     //     var newItem = component.get("v.newItem");
    //     //     console.log("Create item: " + JSON.stringify(newItem));
    //     //    var newItems = component.get("v.items");
    //     //   newItems.push(JSON.parse(JSON.stringify(newItem)));
    //     //   component.set("v.items", newItems);
    //     //   component.set("v.newItem",{'sobjectType':'Camping_Item__c',
    //     //   'Name': '',
    //     //   'Quantity__c': 0,
    //     //   'Price__c': 0,
    //     //   'Packed__c': false});
    //     action.setParams({
    //         "item": validCampingItem
    //     });
    //     action.setCallback(this, function(response){
    //         let state = response.getState();
    //         if (state === "SUCCESS") {
    //             let items = component.get("v.items");
    //             items.push(response.getReturnValue());
    //             component.set("v.items", items);
    //         }
    //     });
    //     $A.enqueueAction(action);
    //     }
   
    // }
})