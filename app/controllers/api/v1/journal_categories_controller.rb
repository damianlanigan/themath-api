module Api
	module V1
	
		class JournalCategoriesController < ApiController

			before_filter :require_oauth_application	
			respond_to    :json

		  def index
		  	response = { journal_categories: JournalCategory.all }
		  	render json: response
		  end

		  def core
		  	response = { journal_categories: JournalCategory.where(core:true) }
		  	render json: response
		  end

	 	end

	end
end