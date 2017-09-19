var MyController = Marionette.Controller.extend({
  index: function() {console.log('***************In Customer Index function*******************')},
  show:function(){console.log('******************In show Method*********************')},
  search: function(){console.log('****************In Search Method******************')},
  comment: function(){console.log('****************In Comment Method******************')}
});

var myController = new MyController()

ModeratorRouter = Mn.AppRouter.extend({
  controller: myController,
  appRoutes: {
    'customers':'index',
    'customers/search':'search',
    'customers/comment':'comment'
  },
  onRoute: function(name, path, args) {
    console.log('**********************User navigated to ' + path +'*************************');
  }
});

new ModeratorRouter()
