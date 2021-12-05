class Api::V1::BaseController < ApplicationController
  rescue_from ApiExceptions::Base, with: :render_error

  private

  def render_error(error)
    render json: ApiExceptions::Serializer.new(error), status: error.respond_to?(:status) ? error.status : 500
  end

  def per_page
    params[:limit] || 20
  end

  def page_offset
    params[:offset] || 20
  end

  def page_query_params
    query_params = { limit: per_page, offset: page_offset }.to_query

    '/?' + query_params
  end
end
