Shop = Backbone.Model.extend({
  urlRoot: '/moderators/shops',
  initialize: function(){ this.on('change',this.someChange,this)},
  someChange: function(model,options){
    alert("something has changed");
  },
  defaults : {
     title : 'untitled',
     description : 'no description available',
     owner : 'anonymous',
     date : 'no date supplied'
   },
  url:  function(){
    return `/moderators/shops`
  }

});

Shops = Backbone.Collection.extend({
  model: Shop,
  url: '/moderators/shops',
  initialize : function () {
		this.on("add",this.newComer,this);
		this.on("change",this.someChange,this);
},
newComer : function (model) {
  alert("welcome "+model.get("title"));
}
});
m1=new Shop({title : "my first object"})
m1.set({title:"object has changed"})
//console.log(m1.fetch())
var m = new Shops();
m.add(m1)
console.log(m)
