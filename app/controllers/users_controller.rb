class UsersController < ApplicationController
  before_filter :authenticate_user!

  before_action :check_and_set_user
  before_action :check_if_admin_or_self_customer

  # GET /users/1
  def show

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_and_set_user
      @user = User.find(params[:id])
    end

    def check_if_admin_or_self_customer
      unless current_user.is_admin? or
             (current_user == @user and @user.is_a_customer?)
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end
end
