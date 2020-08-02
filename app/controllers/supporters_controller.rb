class SupportersController < ApplicationController

  before_action :set_teams
  before_action :set_supporter


  def index
  end

  def show
  end
  
  def edit
  end

  def update
    if current_supporter.update(supporter_params)
      redirect_to supporter_path(current_supporter)
    else
      render :edit
    end
  end

  private

  def set_teams
    @teams = Team.all
  end

  def set_supporter
    @supporter = Supporter.find(params[:id])
  end

  protected

  def supporter_params
    params.require(:supporter).permit(:name, :email, :avatar_image, :biography)
  end

end
