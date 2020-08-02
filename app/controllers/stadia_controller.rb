class StadiaController < ApplicationController
  before_action :set_teams

  def index
    @stadiums = Stadium.all.includes(:matches)
  end

  def show
  end

  private

  def set_teams
    @teams = Team.all
  end
end
