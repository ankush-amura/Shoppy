var ModeratorSalesView = Marionette.CompositeView.extend({
  template: JST['composite_sale'],
  childView: moderatorSales,
  childViewContainer: '#table_sale_body'

});

var ModeratorShopsView =Marionette.CompositeView.extend({
  template: JST['composite_shop'],
  childView: moderatorShops,
  childViewContainer: '#table_shop_body'

});
