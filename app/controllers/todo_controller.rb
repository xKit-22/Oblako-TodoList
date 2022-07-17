class TodoController < ApplicationController
  def index
    @todo = Todo.all
    render json: @todo
  end
  def create
    @project = get_project
    if @project.todos.create!(todo_params)
      render json: @todo
    else
      render error: { error: 'Unable to create todo.' }, status: 404
    end

  end
  def update
    @todo = Todo.find(params[:todoId])
    if @todo.update!(todo_params)
      render json: @todo
    else
      render error: { error: 'Unable to update todo.' }, status: 404
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:text, :isCompleted)
  end

  def get_project
    @project = Project.find(params[:id])
  end
end
