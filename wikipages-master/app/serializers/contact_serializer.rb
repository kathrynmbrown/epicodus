class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email
end
