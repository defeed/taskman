class TasksController < ApplicationController
  before_filter :authorize

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @list = @task.list
    @comments = @task.comments.all
    @comment = Comment.new
    @title = @list.name
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
    @list = @task.list
    @title = @list.name
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(params[:task])

    if @task.save
      redirect_to list_url(@list), notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    @list = @task.list

    if @task.update_attributes(params[:task])
      redirect_to list_task_url, notice: 'Task was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @list = List.find(params[:list_id])
    @task.destroy
    redirect_to list_url(@list)
  end
  
  def toggle
    @task = Task.find(params[:id])
    @list = List.find(params[:list_id])
    @task.toggle!(:completed)
    redirect_to list_url(@list)
  end
  
  def sort
    params[:task].each_with_index do |id, index|
      Task.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
