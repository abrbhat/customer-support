class CustomersController < ApplicationController
  before_filter :authenticate_user!

  before_action :check_if_admin, except: [:show]
  before_action :check_and_set_customer, only: [:show, :update]
  before_action :check_if_admin_or_self, only: [:show]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render :show, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render :show, status: :ok
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_if_admin
      unless current_user.is_admin?
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end

    def check_if_admin_or_self
      unless current_user.is_admin? or
             current_user == @customer
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end

    def check_and_set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(
        :subject,
        :description,
        :status,
        :severity,
        :category
      )
    end
end
