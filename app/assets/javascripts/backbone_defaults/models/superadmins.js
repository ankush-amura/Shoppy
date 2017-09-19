Superadmin = Backbone.Model.extend({
  url: '/superadmins'
});

Superadmins = Backbone.Collection.extend({
  model: Superadmin,
  url: '/superadmins'
});
