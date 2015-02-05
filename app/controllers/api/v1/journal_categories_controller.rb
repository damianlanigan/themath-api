module Api
	module V1
	
		class JournalCategoriesController < ApiController

		  def list
		  	journal_categories = JournalCategory.all
		  	render json: journal_categories
		  end

		  def core
		  	journal_categories = JournalCategory.where(core:true)
		  	render json: journal_categories
		  end

	 	end

	end
end