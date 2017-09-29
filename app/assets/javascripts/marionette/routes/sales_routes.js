
var myController = new sales_controller()
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
