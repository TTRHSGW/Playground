class TodosController < ApplicationController
  before_action :set_todo, only: %i[update]

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo.project
    else
      redirect_to @todo.project
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo.project
    else
      redirect_to @todo.project
    end
  end

    private

    def todo_params
      params.require(:todo).permit(:content, :done, :project_id )
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
end
