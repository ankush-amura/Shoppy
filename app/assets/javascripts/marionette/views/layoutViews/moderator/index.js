moderatorLayout = Marionette.LayoutView.extend({
  template: JST['moderatorLayout'],
  regions: {
    sales: '#moderator_layout1',
    shops: '#moderator_layout2'
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
 events: {
   "click .add":function(){
     Backbone.history.navigate('/moderators/new',{trigger:true})
   },
   "click .delete": function(){
     Backbone.history.navigate('/moderators/delsale',{trigger:true})
   },
   "keypress #search_box":function(){
     $.ajax({
      type: 'GET',
      url: '/moderators/search',
      data: { search : $('#search_box').val() },
      dataType: 'json',
      success: function(response) {
        $('#search').text("");
        console.log(response)
        response.forEach(function(product) {
           console.log(product)
          $('#search').append('<option value="' + product.name + '">');
        })
      }
    });
   }
 }
});
