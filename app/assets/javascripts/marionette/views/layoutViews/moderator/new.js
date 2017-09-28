moderatorLayoutNew = Marionette.LayoutView.extend({
  template: JST['moderatorLayoutNew'],
  regions: {
    new: '#newShop',
  },
  onRender: function(){
    console.log("i am in Render function LayoutView")

  },
  onBeforeRender: function() {
     console.log("i am in Pre render function LayoutView")
      // set up final bits just before rendering the view's `el`
    },
  onAttach: function() {
   console.log('In attach event for LayoutView');
  },

  onDomRefresh: function() {
     console.log('dom:refresh LayoutView');
   },
});
