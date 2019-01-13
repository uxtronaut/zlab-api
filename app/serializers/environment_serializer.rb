class EnvironmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :domain
end
