class SupportRequestsController < ApplicationController
  before_filter :authenticate_user!
  
  before_action :set_support_request, only: [:show, :update, :destroy]

  # GET /support_requests
  def index
    @support_requests = SupportRequest.all
  end

  # GET /support_requests/1
  def show
    render json: @support_request
  end

  # POST /support_requests
  def create
    @support_request = SupportRequest.new(support_request_params)

    if @support_request.save
      render json: @support_request, status: :created, location: @support_request
    else
      render json: @support_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /support_requests/1
  def update
    if @support_request.update(support_request_params)
      render json: @support_request
    else
      render json: @support_request.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def support_request_params
      params.require(:support_request).permit(:subject, :description, :closed_at, :status, :severity, :category)
    end
end
