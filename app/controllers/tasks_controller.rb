class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect_to task_path(task)
    else
      raise
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
