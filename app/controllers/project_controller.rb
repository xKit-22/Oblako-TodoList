class ProjectController < ApplicationController
  def index
    @projects = Project.all
    render json: @projects.map { |project| {:id => project.id, :title => project.title, :todos => project.todos} }
  end

  def create

    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      render error: { error: 'Unable to create project.' }, status: 404
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :todos)
  end
end