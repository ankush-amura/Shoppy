var myController = new moderators_controller()

ModeratorRouter = Mn.AppRouter.extend({
  controller: myController,
  appRoutes: {
    'moderators':'index',
    'moderators/new':'new',
    'moderators/delsale':'delsale'
  },
  onRoute: function(name, path, args) {
    console.log('**********************User navigated to ' + path +'*************************');
  }
});

new ModeratorRouter()
