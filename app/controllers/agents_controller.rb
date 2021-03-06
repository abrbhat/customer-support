# Handles requests to /api/agents
class AgentsController < ApplicationController
  # Limit access to admins
  before_action :check_if_admin

  before_action :set_agent, only: [:show, :update, :destroy]

  # GET /agents
  def index
    @agents = Agent.all.sort
  end

  # GET /agents/1
  def show

  end

  # POST /agents
  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      render :show, status: :created
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agents/1
  def destroy
    if @agent.destroy
      render :show, status: :ok
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  private
    # Check if current user is an admin
    def check_if_admin
      unless current_user.is_admin?
        render json: {"errors" => ["Inaccessible Resource"]},
               status: :unauthorized
        return
      end
    end

    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agent_params
      params.require(:agent).permit(
        :email,
        :password
      )
    end
end
