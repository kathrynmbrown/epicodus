HipsterDo.NewListController = Ember.ObjectController.extend({
  actions: {
    createList: function() {
      var model = this.get('model');
      var controller = this;

      model.save()
      .then(function() {
        controller.transitionToRoute('list', model);
      })
      .catch(function() {
        alert("Please fix the problems noted in red.")
      });
    }
  }
});
