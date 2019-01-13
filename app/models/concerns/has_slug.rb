module HasSlug
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true, uniqueness: true

    before_validation :generate_slug, on: :create
    after_validation :add_slug_error_to_name

    def to_param
      slug
    end

    private
    def generate_slug
      return if name.blank?

      self.slug = name.downcase.parameterize
    end

    def add_slug_error_to_name
      if errors[:slug].any?
        errors.add :name, 'would result in duplicate/invalid slug'
      end
    end
  end
end
