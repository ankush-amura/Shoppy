moderators_controller = Marionette.Controller.extend({
  index: function() {
    console.log('In Moderator Index function')
    moderators = new Moderators()
    shops = new Shops()
    moderators.fetch().done(function(){
      console.log(moderators.fetch())
      shops.fetch().done(function(){
        console.log(shops.fetch())
        var moderatorLayout1 =  new moderatorLayout();
          $('body').html(moderatorLayout1.render().$el);
          moderatorLayout1.showChildView('sales', new ModeratorSalesView({collection: moderators}));
         moderatorLayout1.showChildView('shops', new ModeratorShopsView({collection: shops}));
      })

    })
  },
  new: function(){
    console.log('In Moderator new Method');
    Usales = new USales()
    Usales.fetch().done(function(){
      console.log(Usales.fetch())
        var moderatorNewLayout1 =  new moderatorLayoutNew();
          $('body').html(moderatorNewLayout1.render().$el);
          moderatorNewLayout1.showChildView('new', new moderatorSalesCollection({collection: Usales}));
    })

  },
  delsale: function(){
    console.log('In Moderator Del Sale Method')
    sale = new Sales()
    sale.fetch().done(function(){
      console.log(sale.fetch())
        var moderatorLayoutDel1 =  new moderatorLayoutDel();
          $('body').html(moderatorLayoutDel1.render().$el);
          moderatorLayoutDel1.showChildView('new', new moderatorDelSalesCollection({collection: sale}));
    })
   }
});
