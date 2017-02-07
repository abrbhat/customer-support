class SupportRequestsController < ApplicationController
  before_filter :authenticate_user!

  before_action :check_if_customer, only: :create
  before_action :check_and_set_support_request, only: [:show, :update]

  # GET /support_requests
  def index
    if current_user.is_admin?
      @support_requests = SupportRequest.all.sort.reverse
    else
      @support_requests = current_user.support_requests.sort.reverse
    end
  end

  # GET /support_requests/1
  def show

  end

  # POST /support_requests
  def create
    @support_request = SupportRequest.new(support_request_params)
    @support_request.customer = current_user

    if @support_request.save
      render :show, status: :created
    else
      render json: @support_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /support_requests/1
  def update
    if @support_request.update(support_request_params)
      render :show, status: :ok
    else
      render json: @support_request.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_and_set_support_request
      @support_request = SupportRequest.find(params[:id])

      unless current_user.is_admin? or
             @support_request.in? current_user.support_requests
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end

    def check_if_customer
      unless current_user.is_a_customer?
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end

    # Only allow a trusted parameter "white list" through.
    def support_request_params
      params.require(:support_request).permit(
        :subject,
        :description,
        :status,
        :severity,
        :category
      )
    end
end
