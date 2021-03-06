class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  include HasSlug

  field :_id, type: String, default: ->{ SecureRandom.uuid }
  field :slug, type: String
  field :name, type: String

  validates :name, presence: true, uniqueness: true

  embeds_many :environments
end
