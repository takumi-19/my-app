class Api::CommentsController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    match = Match.find(room.match_id)
    stadium = Stadium.find(match.stadium_id)
    last_comment_id = params[:id]
    @comments = room.comments.includes(:supporter).where("id > ?", last_comment_id)
  end
end