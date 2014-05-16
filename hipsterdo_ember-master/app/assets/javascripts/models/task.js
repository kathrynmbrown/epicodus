HipsterDo.Task = DS.Model.extend({
  name: DS.attr(),
  description: DS.attr(),
  list: DS.belongsTo('list')
});
