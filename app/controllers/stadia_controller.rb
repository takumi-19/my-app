class StadiaController < ApplicationController
  before_action :set_teams
  before_action :set_support_team

  def index
    @stadiums = Stadium.all
    @matches = Match.all.order("kick_off ASC")
  end

  def show
  end

  private

  def set_teams
    @teams = Team.all
  end
  
  def set_support_team
    @support_team = Team.find(current_supporter.team_id)
  end
end
