  module Api
  module V1
    class SignupController < ApiController

      before_filter :require_oauth_application, only: [:create]

      # POST /api/v1/signup
      def create
        @signup = Signup.new(signup_params)

        if @signup.save
          access_token = Doorkeeper::AccessToken.create(
            application_id: oauth_application.id,
            resource_owner_id: @signup.user.id,
            use_refresh_token: Doorkeeper.configuration.refresh_token_enabled?,
            expires_in: Doorkeeper.configuration.access_token_expires_in)

          render json: {
            access_token: access_token.token,
            refresh_token: access_token.refresh_token
          }
        else
          render json: { errors: @signup.errors }
        end
      end

      protected

      def signup_params
        params.require(:signup).permit(
          :email,
          :password)
      end

    end
  end
end
