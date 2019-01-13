class Environment
  include Mongoid::Document
  include Mongoid::Timestamps

  include HasSlug

  field :_id, type: String, default: ->{ SecureRandom.uuid }
  field :slug, type: String
  field :name, type: String
  field :domain, type: String

  validates :name, :domain, presence: true, uniqueness: true

  embedded_in :site
end
