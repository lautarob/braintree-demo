class AuthController < ApplicationController
  def client_token
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => "z3bjy4gf84ndr6yw",
      :public_key => "vfm7sr5ybvr9ksdb",
      :private_key => "aef19197d1a15e676d2263c9bd71c91f",
    )
    @client_token = gateway.client_token.generate

    respond_to do |format|
      format.any { render json: { client_token: @client_token }, content_type: 'application/json' }
    end
  end
end
