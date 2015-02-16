module Api
  module V1
  
    class UserJournalCategoriesController < ApiController

      before_filter :require_oauth_application,:doorkeeper_authorize!
      respond_to    :json

      def update
        #Find or Create user_journal_categories based on input
        user_journal_categories = Array.new
        
        params[:journal_categories].map { |journal_category| journal_category[:id] }.each do |journal_category_id|
          new_journal_category = UserJournalCategory.where(user_id: current_resource_owner.id, journal_category_id: journal_category_id).first_or_create
          user_journal_categories.push(new_journal_category)
        end
    
        #Update all to active case of existing entries to active.
        user_journal_category_ids = user_journal_categories.map { |ujc| ujc.id }
        UserJournalCategory.where(id: user_journal_category_ids).update_all(active: true)

        #Set any not included to false if they do not exist.
        UserJournalCategory.where.not( id: user_journal_category_ids ).update_all( active: false)

        render json: { active_journal_categories: user_active_journals }
      end


      def index
        current_user = current_resource_owner
        render json: { active_journals_categories: user_active_journals} 
      end
      
      protected

      def user_active_journals 
        UserJournalCategory.includes(:journal_category).where(user_id: current_resource_owner.id, active: true)
      end

    end

  end
end