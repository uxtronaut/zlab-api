class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: ->{ SecureRandom.uuid }
  field :slug, type: String
  field :name, type: String
  field :domain, type: String
  field :published_at, type: DateTime
  field :saved_at, type: DateTime
  field :favicon, type: String

  validates :slug, :name, :domain, presence: true, uniqueness: true

  before_validation :generate_slug

  private
  def generate_slug
    return if name.blank?
    self.slug = name.downcase.parameterize
  end
end
