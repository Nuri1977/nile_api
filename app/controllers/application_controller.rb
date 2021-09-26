class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private

  def not_destroyed(e)
    render json: {errors: e.record}, status: :unprocessable_entity
  end
end
