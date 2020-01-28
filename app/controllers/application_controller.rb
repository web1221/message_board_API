class ApplicationController < ActionController::API
  include Response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({message: exception.message }, :not_found)
  end

end
