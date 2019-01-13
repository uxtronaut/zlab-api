class SiteSerializer < ActiveModel::Serializer
  attributes :id, :slug, :name, :errors

  def attributes(*args)
    hash = super
    hash.delete(:errors) if object.errors.keys.empty?
    hash
  end
end
