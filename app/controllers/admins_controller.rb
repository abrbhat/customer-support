class AdminsController < ApplicationController
  before_filter :authenticate_user!

  before_action :check_if_admin
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  def index
    @admins = Admin.all.sort.reverse
  end

  # GET /admins/1
  def show

  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render :show, status: :created
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @admin.destroy
      render :show, status: :ok
    else
      render json: @admin.errors, status: :unprocessable_entity
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

    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(
        :email,
        :password
      )
    end
end
