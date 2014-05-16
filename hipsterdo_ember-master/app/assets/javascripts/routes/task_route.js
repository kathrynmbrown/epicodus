HipsterDo.TaskRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('task', params.id);
  }
});
