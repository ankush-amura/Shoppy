customers_controller = Marionette.Controller.extend({
  index: function() {
    customers = new Customers();
    customers.fetch().done(function() {
      console.log(customers.fetch())
    var customer_view = new customerCollection({collection: customers});
    $('body').html(customer_view.render().$el);
    customer_view.on("something:do:it", function(args){
        console.log("inside click event")
        console.log(args.view) // => the view instance that triggered the event
        console.log(args.model) // => the view.model, if one was set on the view
        console.log(args.collection) // => the view.collection, if one was set on the view
        alert("I DID IT!");
      });
      customer_view.$(".do-something").trigger("click");

    });
  },
  show:function(){console.log('In show Method')},
  search: function(){console.log('In Search Method')},
  comment: function(){console.log('In Comment Method')}
});
