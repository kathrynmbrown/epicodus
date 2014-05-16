HipsterDo.List = DS.Model.extend({
  name: DS.attr(),
  description: DS.attr(),
  tasks: DS.hasMany('task')
});
