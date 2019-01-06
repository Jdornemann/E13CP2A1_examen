class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]

def index

  @todos = Todo.all

end

def show
end

def edit
end

def new

  @todo = Todo.new

end

def update

 @todo.update(todo_params)
 redirect_to todos_home_path

end

def list

  @todos = Todo.all

end

def complete 

  @todo.update_attribute(:completed, true)
  redirect_to todos_home_path
end

def destroy
    @todo.destroy
    redirect_to todos_home_path
end

def create 

    
    @todo = Todo.new(todo_params)
    
    
    respond_to do |format|
        if @todo.save
          format.html { redirect_to todos_home_path, notice: 'ToDo List was successfully created.' }
          format.json { render :show, status: :created, location: @todo }
        else
          format.html { render :new }
          format.json { render json: @todo.errors, status: :unprocessable_entity }
        end
      end
end

def todo_params

    params.require(:todo).permit(:description,:completed)
end


def set_todo
  @todo = Todo.find(params[:id])
end

end
