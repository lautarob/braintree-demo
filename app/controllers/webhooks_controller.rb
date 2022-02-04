class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    respond_to do |format|
      format.any { render json: { }, content_type: 'application/json' }
    end
  end

end
