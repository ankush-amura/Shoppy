var MyController = Marionette.Controller.extend({
  index: function() {console.log('***************In Moderator Index function*******************')},
  new: function(){console.log('******************In Moderator new Method*************************')},
  delsale: function(){console.log('*****************In Moderator Del Sale Method*****************')}
});

var myController = new MyController()

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
