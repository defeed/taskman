class CommentsController < ApplicationController
  respond_to :html, :js
  def create
    @list = List.find(params[:list_id])
    @comment = Comment.new(params[:comment])
    @task = @comment.task_id
    @comment.save
    # redirect_to list_task_url(@list, @task)
    respond_with @comment, :location => list_task_url(@list, @task)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
