var myController = new users_controller()

ModeratorRouter = Mn.AppRouter.extend({
  controller: myController,
  appRoutes: {
    'users/sign_in':'signIn',
    'users/password/new':'newPassword',
    'users/password/edit':'editPassword',
    'users/cancel':'cancel',
    'users/sign_up':'signUp',
    'users/edit':'edit'
  },
  onRoute: function(name, path, args) {
    console.log('**********************User navigated to ' + path +'*************************');
  }
});

new ModeratorRouter()
