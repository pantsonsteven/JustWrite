var JustWrite = JustWrite || { Models: {}, Views: {}, Collections: {} };

JustWrite.Views.PageListView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render);
  },
  render: function() {
    var that = this;
    this.$el.empty(); 
    _.each(this.collection.models, function(page) {
      var pageView = new JustWrite.Views.PageView({
        model: page
      });
      that.$el.append(pageView.render().el);
    });
  return this;
  } 
});