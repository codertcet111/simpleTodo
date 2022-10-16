class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[ show edit update destroy ]

  # GET: list of all todos
  def index
    @todo_lists = TodoList.all
  end

  # GET: single todo detail
  def show
  end

  # GET new form for creating fresh todo
  def new
    @todo_list = TodoList.new
  end

  # GET: edit form to update a todo item
  def edit
  end

  # POST: create a fresh todo by calling create action
  def create
    @todo_list = TodoList.new(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to todo_list_url(@todo_list), notice: "Your todo list was successfully created." }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT: Update the todo record been performed by update action
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to todo_list_url(@todo_list), notice: "Requested todo list was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE: to delete the todo item
  def destroy
    @todo_list.destroy

    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: "Todo list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Settingt the todo item by id passed
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Strong params feature, allowing only valid params
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
