Wikipages.ContactController = Ember.ObjectController.extend({
  actions: {
    deleteContact: function() {
      if (confirm('Are you sure?')) {
        this.get('model').destroyRecord();
      }
    }
  }
});
