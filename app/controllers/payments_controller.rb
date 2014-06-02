class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:index, :show, :new, :create]
  before_action :any_free?, only: [:index,:show, :new]

  def index
  end

  def show
  end


  def new
    @payment = @customer.payments.new
  end


  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    respond_to do |format|
      if @payment.save
        format.html { redirect_to  @payment.customer, notice: 'Payment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end
    def set_customer
      @customer = Customer.includes(:payments).find(params[:customer_id])
    end
    def payment_params
      params.require(:payment).permit(:customer_id, :user_id, :amount, :description)
    end
    def any_free?
      if @customer.next_free?
        @free = 'ЭТА МОЙКА БЕСПЛАТНАЯ'
      end
    end
end
