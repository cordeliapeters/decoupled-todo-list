class TodosController < ApplicationController
  after_filter :cors_set_access_control_headers

  def index
    @todos = User.find(session[:user_id]).todos.all
    # @todos = Todo.all
    render json: @todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @new_todo = Todo.new(title: params[:title], description: params[:description])
    if @new_todo.save
        render json: @new_todo
    end
    # else
    #   @errors = "You need to complete all of the fields"
    #   render :new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update_attributes(title: params[:todo][:title], description: params[:todo][:description])
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.json { render json: @todo }
    end
  end

  private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
end
