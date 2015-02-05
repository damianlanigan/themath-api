# app/controller/api/v1/api_controller.rb
module Api
  module V1
    class ApiController < ActionController::Base
      respond_to :json

      protected

      def current_resource_owner
        return @current_resource_owner if defined?(@current_resource_owner)
        @current_resource_owner = User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      def application_id
        request.headers["HTTP_X_APPLICATION_ID"]
      end

      def require_oauth_application
        render(status: 403, nothing: true) unless oauth_application
      end

      def oauth_application
        return @oauth_application if defined?(@oauth_application)
        @oauth_application = Doorkeeper::Application.find_by_uid(application_id)
      end

    end
  end
end
