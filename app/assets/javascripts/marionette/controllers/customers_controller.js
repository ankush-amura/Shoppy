customers_controller = Marionette.Controller.extend({
  index: function() {
    customers = new Customers();
    customers.fetch().done(function() {
    console.log(customers.fetch())
    var customer_view = new CustomerTableView({collection: customers});
    $('body').html(customer_view.render().$el);
      // customer_view.$("#comment").trigger("click");

    });
  },
  show:function(){console.log('In show Method')},
  search: function(){console.log('In Search Method')},
  comment: function(){
    console.log('In Comment Method'
  )}
});
