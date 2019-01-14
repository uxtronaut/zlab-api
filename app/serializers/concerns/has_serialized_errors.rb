module HasSerializedErrors
  extend ActiveSupport::Concern

  included do
    def attributes(*args)
      hash = super
      hash.delete(:errors) if object.errors.keys.empty?
      hash
    end
  end
end