class TeamsController < ApplicationController
  before_action :set_teams
  
  def index
  end

  def show
    @team = Team.find(params[:id])
    @matches = Match.where(home_team_id: @team.id).or(Match.where(away_team_id: @team.id)).includes(:rooms, :stadium).order("kick_off DESC")
    @homestadium = Stadium.find(@team.id)
  end

  private

  def set_teams
    @teams = Team.all
  end
end
