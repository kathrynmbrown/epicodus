// For more information see: http://emberjs.com/guides/routing/

HipsterDo.Router.map(function() {
  this.resource('lists', { path: '/' }, function () {
    this.resource('new_list', { path: '/lists/new' });
    this.resource('tasks', { path: '/:list_id/tasks' }, function () {
      this.resource('new_task', { path: '/tasks/new' });
    });
  });
  this.resource('list', { path: '/lists/:id' });
  this.resource('edit_list', { path: '/lists/:id/edit' });
  this.resource('task', { path: '/tasks/:id' });
});
