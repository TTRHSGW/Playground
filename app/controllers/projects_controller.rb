class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.includes(:todos).where(todos: { done: false } )
  end

  def show
    @todo = Todo.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit;end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path
    else
      redirect_to projects_path
    end
  end

    private

    def project_params
      params.require(:project).permit(:title)
    end

    def set_project
      @project = Project.find(params[:id])
    end

end
