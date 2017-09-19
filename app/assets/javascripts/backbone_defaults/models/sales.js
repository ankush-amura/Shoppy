Sale = Backbone.Model.extend({
  url: '/sales'
});

Sales = Backbone.Collection.extend({
  model: Sale,
  url: '/sales'
});
