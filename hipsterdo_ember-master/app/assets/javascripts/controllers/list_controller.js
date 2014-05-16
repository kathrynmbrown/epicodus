HipsterDo.ListController = Ember.ObjectController.extend({
  actions: {
    deleteList: function() {
      if (confirm('Are you sure?')) {
        this.get('model').destroyRecord();
      }
    }
  }
});
