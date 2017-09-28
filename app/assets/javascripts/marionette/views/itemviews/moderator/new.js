moderatorSalesNew = Marionette.ItemView.extend({
  template: JST['collectionNewModerator'],
  tagName: 'tr',
  serializeData: function() {
    return {
  		'sales' : this.model.attributes
    }
  },

  onBeforeRender: function() {
     console.log("i am in Pre render function ItemView")
      // set up final bits just before rendering the view's `el`
    },

  onRender: function() {
    console.log('I am in render function ItemView');
  },

  onAttach: function() {
   console.log('In attach for ItemView');
  },

  onDomRefresh: function() {
     console.log('In dom:refresh For ItemView');
   },
   events:{
     "click .assign": function(event){
      console.log( $(event.currentTarget).data('id'))
      $.ajax({
      type: 'GET',
      url: '/moderators/assign',
      data: { id : $(event.currentTarget).data('id') },
      dataType: 'json',
      success: function(response) {
        console.log(response)
      }
    });
     }
   }
});
