Sale = Backbone.Model.extend({
  urlRoot: '/moderators'
});

Sales = Backbone.Collection.extend({
  model: Sale,
  url: '/moderators'
});
