var MyController = Marionette.Controller.extend({
  index: function() {console.log('***************In Sales Index function*******************')},
  newShop: function(){console.log('***************In Sales newshop function****************')},
  edit: function(){console.log('******************In Sales edit function********************')}
});

var myController = new MyController()

ModeratorRouter = Mn.AppRouter.extend({
  controller: myController,
  appRoutes: {
    'sales':'index',
    'sales/newShop':'newShop',
    'sales/:id/edit':'edit'
  },
  onRoute: function(name, path, args) {
    console.log('**********************User navigated to ' + path +'*************************');
  }
});

new ModeratorRouter()
