var myController = new superadmins_contoller()

ModeratorRouter = Mn.AppRouter.extend({
  controller: myController,
  appRoutes: {
    'superadmins':'index',
    'superadmins/new':'new',
    'superadmins/delmod':'delmod'
  },
  onRoute: function(name, path, args) {
    console.log('**********************User navigated to ' + path +'*************************');
  }
});

new ModeratorRouter()
