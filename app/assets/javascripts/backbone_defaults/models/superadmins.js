Superadmin = Backbone.Model.extend({
  urlRoot: '/superadmins'
});

Superadmins = Backbone.Collection.extend({
  model: Superadmin,
  url: '/superadmins'
});
