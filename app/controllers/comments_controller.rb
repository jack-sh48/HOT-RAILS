class CommentsController < ApplicationController
  before_action :set_todo

  def create
    @todo.comments.create! params.require(:comment).permit(:content)
    redirect_to @todo
  end

  private
  def set_todo
    @todo = Todo.find(params[:todo_id])
  end
end
