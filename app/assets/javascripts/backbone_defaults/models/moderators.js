Moderator = Backbone.Model.extend({
  urlRoot: '/moderators',
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
    return `/moderators/`
  }

});

Moderators = Backbone.Collection.extend({
  model: Moderator,
  url: '/moderators',
  initialize : function () {
		this.on("add",this.newComer,this);
		this.on("change",this.someChange,this);
},
newComer : function (model) {
  alert("welcome "+model.get("title"));
}
});
m1=new Moderator({title : "my first object"})
m1.set({title:"object has changed"})
//console.log(m1.fetch())
var m = new Moderators();
m.add(m1)
console.log(m)
