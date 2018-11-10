module Concerns::Errors
  extend ::ActiveSupport::Concern

  included do
    rescue_from Mongoid::Errors::InvalidFind, with: :render_unprocessable_entity
  end
end
