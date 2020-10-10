class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index;end

  def show;end

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

  def update;end

    private

    def project_params
      params.require(:project).permit(:title)
    end

    def set_project
      @project = Project(params[:id])
    end

end
