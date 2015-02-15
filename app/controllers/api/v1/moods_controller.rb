module Api
	module V1

		class MoodsController < ApiController

			before_filter :require_oauth_application,:doorkeeper_authorize!
			respond_to :json

			def create

				mood = current_resource_owner.moods.new(mood_params(params[:mood]))

				if mood.valid?
					mood.save
					render json: { mood: mood }
				else
					render json: { errors: mood.errors }, status: 422
				end	

			end

			def update
				mood = current_resource_owner.moods.find(params[:id])
				ap params[:mood]
				if mood.update(mood_params(params[:mood]))
					render json: { mood: mood}
				else
					render json: { errors: mood.errors, status: 422}
				end
			end

			def destroy
				current_resource_owner.moods.find(params[:id]).destroy
				head 204
			end

			def show
				render json: current_resource_owner.moods.find(params[:id])
			end

			protected

			def mood_params(hash)
				params = ActionController::Parameters.new(hash)
				params.permit(
					:created_at,
					:score
				)
			end

		end
	
	end
end