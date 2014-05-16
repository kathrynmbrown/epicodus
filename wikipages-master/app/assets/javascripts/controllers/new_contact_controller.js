Wikipages.NewContactController = Ember.ObjectController.extend({
  actions: {
    createContact: function() {
      var model = this.get('model');
      var controller = this;

      model.save()
      .then(function() {
        controller.transitionToRoute('contact', model);
      })
      .catch(function() {
        alert("Please fix the problems noted in red.")
      });
    }
  }
});
