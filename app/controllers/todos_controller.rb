class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: %i[ show edit update destroy toggle ]

  def index
    @todos = current_user.todos.order(created_at: :desc)
  end

  def show
  end

  def new
    @todo = current_user.todos.new
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: "Todo を作成しました。" }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path, notice: "Todo を更新しました。" }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy!
    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Todo を削除しました。", status: :see_other }
      format.json { head :no_content }
    end
  end

  def toggle
    @todo.update!(completed: !@todo.completed)
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :body, :due_date, :completed, :tags)
  end
end
