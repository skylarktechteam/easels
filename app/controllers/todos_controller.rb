class TodosController < ApplicationController

	def index
		@todos =Todo.all
		#only show to-dos from the signed in user
		#@todos = current_email.todos
		@todos =Todo.where(email: current_email)
	end
	
	def new
		@todo = Todo.new
	end

	def create
		#@todo = Todo.new(todo_params)
		
		@todo = Todo.create(:title => params[:todo][:title], :email => current_email)
		
		redirect_to root_path
		#if @todo.save
		#	redirect_to root_path
		#end
	end

private 
	def todo_params
			params.require(:todo).permit(:title)
	end

end