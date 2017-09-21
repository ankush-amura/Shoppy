Customer = Backbone.Model.extend({
   urlRoot: '/customers'
 });

Customers = Backbone.Collection.extend({
  model: Customer,
  urlRoot: '/customers',
  url: '/customers'
});
