class MatchesController < ApplicationController

  before_action :set_stadiums
  before_action :set_teams
  before_action :set_matches

  def index
  end

  def show
    @match = Match.find(params[:id]).includes(:rooms)
    @hometeam_room = @match.rooms.find_by(team_id: @match.home_team_id)
    @awayteam_room = @match.rooms.find_by(team_id: @match.away_team_id)
  end

  def new
    @match = Match.new
    @room = Room.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      Room.create(team_id: @match.home_team_id, match_id: @match.id)
      Room.create(team_id: @match.away_team_id, match_id: @match.id)
      redirect_to new_match_path
    else
      render :new
    end
  end

  def edit
    @match = Match.find(params[:id]).includes(:rooms)
  end

  def update
    match = Match.find(params[:id]).includes(:rooms)
    match.update(match_params)
    redirect_to matches_path
  end

  def destroy
    match = Match.find(params[:id]).includes(:rooms)
    match.destroy
    if match.destroy
      redirect_to matches_path
    end
  end

  private

  def set_stadiums
    @stadiums = Stadium.all
  end

  def set_teams
    @teams = Team.all
  end

  def set_matches
    @matches = Match.all.includes(:home_team, :away_team)
  end

  def match_params
    params.require(:match).permit(:week, :kick_off, :home_team_id, :away_team_id, :stadium_id, :home_team_score, :away_team_score)
  end
end
