class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :list_id
end
