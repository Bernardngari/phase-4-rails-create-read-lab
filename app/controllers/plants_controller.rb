class PlantsController < ApplicationController
	def index
		plants = Plant.all
		render json: plants, except:[:created_at, :updated_at]
	end

	def show
		plant = Plant.find_by(id:params[:id])
		render json: plant, except:[:created_at, :updated_at]
	end

	def create
		plant = Plant.create(plant_params)
		render json: plant, status: :created
	end

	#def destroy
	#	Plant.destroy(params[:id])
	#end

	private
	def plant_params
		params.permit(:name, :image, :price)
	end
end
