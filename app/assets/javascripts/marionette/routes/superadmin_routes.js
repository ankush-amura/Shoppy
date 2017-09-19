var MyController = Marionette.Controller.extend({
  index: function() {console.log('***************In Superadmins Index function*******************')},
  new: function(){console.log('***************In Superadmins new function****************')},
  delmod: function(){console.log('******************In Superadmins del moderator function********************')}
});

var myController = new MyController()

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
