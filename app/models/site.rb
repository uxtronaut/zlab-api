class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: ->{ SecureRandom.uuid }
  field :slug, type: String
  field :name, type: String

  validates :slug, :name, presence: true, uniqueness: true

  before_validation :generate_slug

  def to_param
    slug
  end

  private
  def generate_slug
    return if name.blank?
    self.slug = name.downcase.parameterize
  end
end
