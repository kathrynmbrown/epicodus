HipsterDo.NewListRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('list');
  }
});
