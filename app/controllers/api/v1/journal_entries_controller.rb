module Api
  module V1
  
    class JournalEntriesController < ApiController

      before_filter :require_oauth_application,:doorkeeper_authorize!
      respond_to :json

      def create

        journal_entry = current_resource_owner.journal_entries.new(journal_entry_params(params[:journal_entry]))

        if journal_entry.valid? && journal_entry.save
          render json: journal_entry
        else
          render json: { errors: journal_entry.errors }, status: 422
        end

      end

      def show
        render json: current_resource_owner.journal_entries.find(params[:id])
      end

      def destroy
        current_resource_owner.journal_entries.find(params[:id]).destroy
        head 204
      end

      protected

      def journal_entry_params(hash)
        params = ActionController::Parameters.new(hash)
        params.permit(
          :score,
          :note,
          :lat,
          :lng,
          :timestamp,
          categories: []
        )
      end

    end

  end
end