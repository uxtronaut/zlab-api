class SiteSerializer < ActiveModel::Serializer
  attributes :id, :slug, :name, :errors

  has_many :environments

  def attributes(*args)
    hash = super
    hash.delete(:errors) if object.errors.keys.empty?
    hash
  end
end
