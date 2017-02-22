# Handles requests to /api/support_requests
class SupportRequestsController < ApplicationController
  before_filter :authenticate_user!, except: :download_report

  # Limit access to creating a support request only to a customer
  before_action :check_if_customer, only: :create

  before_action :check_and_set_support_request, only: [:show, :update]

  # GET /support_requests
  def index
    # Check whether is report is requested
    if params[:report].blank?
      # Get support requests if report is not requested

      if current_user.is_admin?
        # Get all support requests if the requesting user is an admin
        @support_requests = SupportRequest.all
      elsif current_user.is_an_agent?
        # If the requesting user is an agent, get all the open support requests
        # assigned to her
        @support_requests = current_user.open_support_requests
      elsif current_user.is_a_customer?
        # If the requesting user is a customer, get the support requests created
        # by the customer
        @support_requests = current_user.support_requests
      end

      @support_requests = @support_requests.includes(:agent, :customer)
                                           .sort
                                           .reverse
    else
      # If a support request report is requested, check whether the requesting
      # user is an admin or an agent
      if current_user.is_admin? or
         current_user.is_an_agent?
        # If the requesting user is an admin or an agent, fetch all support requests
        # closed in the last 1 month
        @support_requests = SupportRequest.where(status: 'closed')
                                          .where('closed_at >= ?', 1.month.ago)
                                          .includes(:agent, :customer)
                                          .sort
        respond_to do |format|
          format.pdf {
            send_file Report.generate,
                      :filename => "report.pdf",
                      :type => "application/pdf",
                      :disposition  => "attachment"
          }
          format.json {
            render "support_requests/index"
          }
        end
      else
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end
  end

  # GET /support_requests/1
  def show

  end

  # POST /support_requests
  def create
    @support_request = SupportRequest.new(support_request_params)

    # Set the current user as the creator of the support request
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
