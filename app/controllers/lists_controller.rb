class ListsController < ApplicationController
  before_filter :authorize

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.order("position, created_at")
    @task = @list.tasks.new
    @title = @list.name
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(params[:list])

    if @list.save
      redirect_to @list
    else
      render action: "new"
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(params[:list])
      redirect_to @list
    else
      render action: "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_url
  end
end
