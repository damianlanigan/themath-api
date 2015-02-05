module Api
  module V1
    class UsersController < ApiController
      before_action :doorkeeper_authorize!

      def me
        respond_with current_resource_owner
      end
    end
  end
end