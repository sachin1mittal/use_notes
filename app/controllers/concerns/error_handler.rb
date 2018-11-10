module Concerns::ErrorHandler
  extend ::ActiveSupport::Concern

  def render_unprocessable_entity(err)
    redirect_to notes_path, error: err.message
  end
end
