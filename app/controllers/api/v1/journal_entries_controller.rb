module Api
  module V1
  
    class JournalEntriesController < ApiController

      before_filter :require_oauth_application,:doorkeeper_authorize!
      respond_to :json

      def create
      end

    end

  end
end