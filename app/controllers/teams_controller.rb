class TeamsController < ApplicationController
  before_action :set_teams
  before_action :set_stadiums
  before_action :set_support_team

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
  def set_stadiums
    @stadiums = Stadium.all
  end
  def set_support_team
    @support_team = Team.find(current_supporter.team_id)
  end
end
