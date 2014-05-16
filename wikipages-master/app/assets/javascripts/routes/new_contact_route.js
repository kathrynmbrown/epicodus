Wikipages.NewContactRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('contact');
  }
});
