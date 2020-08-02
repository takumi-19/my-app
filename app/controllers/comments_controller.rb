class CommentsController < ApplicationController

  before_action :set_room
  before_action :set_teams

  def index
    @room = Room.find(params[:room_id])
    @comment = Comment.new
    @comments = @room.comments.includes(:supporter, room: {match: :stadium})
    @matchCard = [Team.find_by(id: @room.match.home_team_id), Team.find_by(id: @room.match.away_team_id)]
  end

  def create
    @comment = @room.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      @comments = @room.comments.includes(:supporter)
      flash.now[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_teams
    @teams = Team.all
  end

  protected

  def comment_params
    params.require(:comment).permit(:content, :image).merge(supporter_id: current_supporter.id)
  end

end
