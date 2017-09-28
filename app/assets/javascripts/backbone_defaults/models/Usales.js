USale = Backbone.Model.extend({
  urlRoot: '/moderators/new'
});

USales = Backbone.Collection.extend({
  model: USale,
  url: '/moderators/new'
});
