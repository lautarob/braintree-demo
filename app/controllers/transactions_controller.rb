class TransactionsController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @transactions = Transaction.all
  end

  def show
  end

  def create
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => "z3bjy4gf84ndr6yw",
      :public_key => "vfm7sr5ybvr9ksdb",
      :private_key => "aef19197d1a15e676d2263c9bd71c91f",
    )
    @transaction = gateway.transaction.sale(
      :amount => params[:transaction][:amount],
      :merchant_account_id => params[:transaction][:merchant_account_id],
      :payment_method_nonce => params[:transaction][:nonce],
      :device_data => params[:transaction][:details],
      :options => {
        :submit_for_settlement => true
      }
    )
    respond_to do |format|
      format.any { render json: { transaction: @transaction }, content_type: 'application/json' }
    end
  end

  def update
    if @transaction.update(transaction_params)
      render :show, status: :ok, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
  end
end
