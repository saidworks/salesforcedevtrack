({
    packItem : function(component, event, helper) {
        let btnClicked = event.getSource();         // the button
        let btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.Packed__c", true); 
        component.set("v.disabled", true); 
    }
})
