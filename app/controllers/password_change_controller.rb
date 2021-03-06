class PasswordChangeController < ApplicationController
  before_filter :require_no_user
  before_filter :require_email_user
  before_filter :require_token

  def show
    respond_to do |format|
      format.json { head :no_content }
      format.html
    end
  end

  def create
    if email_user.change_password(params[:password], params[:password_confirmation])
      # Do not automatically log in the user
      respond_to do |format|
        format.json { head :no_content }
        format.html {
          flash.now[:notice] = "Password updated successfully"
          redirect_to(login_path)
        }
      end
    else
      respond_to do |format|
        format.json { render json: { status: 'error', errors: email_user.errors }.to_json, status: 422 }
        format.html { render :show }
      end
    end
  end

  protected

  # Any existing user should be logged out to prevent session leakage
  def require_no_user
    logout
  end

  # The token is paired with an email parameter so that the user can be
  # found in the database. Once found the tokens can be securely compared
  # to prevent timing attacks. The email address is chosen over the id
  # because the reset was generated using the email address and thus is
  # already known. Using the id would increase information leakage.
  def require_email_user
    deny_user("Invalid email address", root_path) if params[:email].blank? || email_user.blank?
  end

  def email_user
    return @user if defined?(@user)
    @user = User.where(email: params[:email]).first || raise(ActiveRecord::RecordNotFound)
  end

  # Reset password tokens expire after 1 day
  def require_token
    valid = params[:token].present?
    valid = valid && ActiveSupport::SecurityUtils.secure_compare(params[:token], email_user.reset_password_token)
    valid = valid && !email_user.reset_password_token_expired?
    deny_user("Invalid token", root_path) unless valid
  end

end
