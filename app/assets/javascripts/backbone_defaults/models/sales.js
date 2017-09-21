Sale = Backbone.Model.extend({
  urlRoot: '/sales'
});

Sales = Backbone.Collection.extend({
  model: Sale,
  url: '/sales'
});
