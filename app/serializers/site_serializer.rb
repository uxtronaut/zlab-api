class SiteSerializer < ActiveModel::Serializer
  include HasSerializedErrors

  attributes :id, :slug, :name, :errors

  has_many :environments
end
