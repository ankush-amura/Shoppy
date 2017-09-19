Customer = Backbone.Model.extend({
//  urlRoot: '/customers',

   url:  function(){
     return `/customers/${this.id}`
   }

});

Customers = Backbone.Collection.extend({
  model: Customer,
  url: '/customers'
});
