({
    init: function (component, event, helper) {
        
        var actions = [
            { label: 'Show details', name: 'show_details',iconName:'action:preview' },
            { label: 'Delete', name: 'delete',iconName:'action:delete'}];
        
        component.set('v.columns', [
            { label: 'Account Name', fieldName: 'Name', type: 'text',editable : 'true'},
            { label: 'Industry', fieldName: 'Industry', type: 'text'},
            { label: 'Rating', fieldName: 'Rating', type: 'text'},
            { label: 'Phone', fieldName: 'Phone', type: 'Phone',editable : 'true'},
            { type: 'action', typeAttributes: { rowActions: actions, menuAlignment: 'right'} }
            
        ]);
        var action = component.get('c.fetchAccount'); 
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS' || state==='DRAFT'){
                component.set('v.data',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    doSelectedRow : function (component, event, helper) {
         var selectedRows = event.getParam('selectedRows');
        console.log('selected Rows',selectedRows);
    },
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        switch (action.name) {
            case 'show_details':
                alert('Showing Details: '+ JSON.stringify(row));
                break;
            case 'delete':
                var data = component.get('v.data');
                var Index = data.indexOf(row);
                data.splice(Index, 1);
                component.set('v.data', data);
                break;
        }
    },
    handleDraftValues : function (component, event, helper) {
        var draftRecords = event.getParam('draftValues');
        console.log('draftRecords', draftRecords);
         var data = component.get('v.data');
      for(let i=0; i<draftRecords.length;i++){
          var id = draftRecords[i].id;
          var recordIndex = id.substring(4,id.length);
            alert(draftRecords[i].Name+''+data[recordIndex].Id);
        }
    }
})