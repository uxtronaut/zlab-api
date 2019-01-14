class EnvironmentSerializer < ActiveModel::Serializer
  include HasSerializedErrors

  attributes :id, :name, :slug, :domain, :errors
end
