class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: ->{ slug }
  field :slug, type: String
  field :name, type: String
  field :domain, type: String
  field :published_at, type: DateTime
  field :saved_at, type: DateTime
  field :favicon, type: String

  validates :slug, :name, :domain, presence: true, uniqueness: true
end
