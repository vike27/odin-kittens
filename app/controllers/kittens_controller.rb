class KittensController < ApplicationController

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params) 
		@kitten.save

		flash.notice = "Congrats, '#{@kitten.name}' kitten was succesfully created!"
		redirect_to kitten_path(@kitten)
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def index
		@kittens = Kitten.all
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		@kitten.update(kitten_params)

		redirect_to kitten_path(@kitten)
	end

	def destroy
		@kitten = Kitten.find(params[:id])
		@kitten.destroy

		flash.notice = "'#{@kitten.name}' has been deleted"
		redirect_to kittens_path
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end

end


