class TeamsController < ApplicationController
  before_action :set_team
  before_action :set_teams
  before_action :set_stadiums
  before_action :set_support_team

  def index
  end

  def show
    @matches = Match.all.order("kick_off DESC")
    @stadium = Stadium.find(@team.id)
    @rooms = Room.all
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end
  def set_teams
    @teams = Team.all
  end
  def set_stadiums
    @stadiums = Stadium.all
  end
  def set_support_team
    @support_team = Team.find(current_supporter.team_id)
  end
end
