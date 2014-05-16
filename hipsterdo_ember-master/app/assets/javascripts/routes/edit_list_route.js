HipsterDo.EditListRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('list', params.id)
  }
});
