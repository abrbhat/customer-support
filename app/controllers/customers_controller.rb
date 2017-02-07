class CustomersController < ApplicationController
  before_filter :authenticate_user!

  before_action :check_if_admin
  before_action :set_customer, only: :show

  def index
    @customers = Customer.all
  end

  def show
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

    def set_customer
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
