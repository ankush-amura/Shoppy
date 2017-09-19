var myController = new customers_controller()

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
