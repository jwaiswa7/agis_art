class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: { 'error': "Invalid request" }, status: :not_found
  end

  def json_response(object=nil, status = :ok)
    render json: object, status: status
  end
end
