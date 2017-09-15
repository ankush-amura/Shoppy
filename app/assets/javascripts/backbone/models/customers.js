Customer = Backbone.Model.extend({
  url: '/customers'
});

Customers = Backbone.Collection.extend({
  model: Customer
  url: '/customers'
});

var c1= new Customers()
console.log(c1.fetch())
