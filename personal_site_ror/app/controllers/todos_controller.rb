class TodosController < ApplicationController
    before_action :find_todo, only: [:edit, :update, :show, :delete]
    def index
      @todos = Todo.all
      #@articles  = Article.all
    end
    def new
      #@article = Article.new
      @todo = Todo.new
    end


    def create
        @todo = Todo.new(todo_params)
        @todo.done = 0
        if @todo.save
          redirect_to todos_path
        else
          render 'new'
        end
    end

    def show
      #@article = Article.find(params[:id])
    end

    def edit
      #@article = Article.find(params[:id])
    end

    def update
      if @todo.update(todo_params)
        redirect_to todos_path
      else
        render 'edit'
      end
    end

    def destroy
      #@article = Article.find(params[:id])
      #@article.destroy
      #redirect_to articles_path
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to todos_path
    end


    def done
      @todo = Todo.find(params[:id])
      @todo.update_attribute(:done, 1)
      redirect_to todos_path
      end
    private

    def todo_params
      params.require(:todo).permit(:title, :category, :done)
    end


    def find_todo
      @todo = Todo.find(params[:id])
    end

end
