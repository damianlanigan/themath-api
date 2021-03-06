# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  created_at                      :datetime
#  updated_at                      :datetime
#  email                           :string           default(""), not null
#  password_digest                 :string           default(""), not null
#  username                        :string(64)
#  time_zone                       :string           default("Eastern Time (US & Canada)")
#  first_name                      :string
#  last_name                       :string
#  bio                             :text
#  website                         :string
#  phone_number                    :string
#  otp_secret_key                  :string
#  sign_in_count                   :integer          default("0")
#  current_sign_in_at              :datetime
#  last_sign_in_at                 :datetime
#  current_sign_in_ip              :string
#  last_sign_in_ip                 :string
#  original_source                 :string
#  session_source                  :string
#  first_visit_at                  :datetime
#  last_visit_at                   :datetime
#  reset_password_token            :string
#  reset_password_token_created_at :datetime
#  remember_token                  :string
#  remember_token_created_at       :datetime
#  confirmation_email              :string
#  confirmation_token              :string
#  confirmation_token_created_at   :string
#  failed_attempts                 :integer          default("0")
#  locked_at                       :datetime
#  unlock_token                    :string
#  unlock_token_created_at         :datetime
#  suspended_at                    :datetime
#

require 'rails_helper'

describe User do
  let(:user_params) { FactoryGirl.attributes_for(:user) }

  it "has secure password support" do
    expect(User.new).to respond_to(:authenticate)
  end

  it "has one time password support" do
    expect(User.new).to respond_to(:otp_secret_key)
  end

  it "accepts a password confirmation" do
    expect(User.new).to respond_to(:password_confirmation=)
  end

  it "downcases the email address" do
    user = User.new
    user.email = "SIR@CAPSALOCK.COM"
    user.valid?
    expect(user.email).to eq("sir@capsalock.com")
  end

  describe "validations" do
    describe "unique" do
      before(:each) do
        FactoryGirl.create(:user)
      end
      it { should validate_uniqueness_of(:email) }
      it "validates the uniqueness of the the confirmation email" do
        existing_user = FactoryGirl.create(:user)
        user = FactoryGirl.build(:user, email: "old@example.com")
        user.confirmation_email = "new@example.com"
        expect(user).to be_valid
        user.confirmation_email = existing_user.email
        expect(user).to_not be_valid
      end
    end
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }

  end

  describe "tokens" do
    it "sets the remember token" do
      user = User.new
      expect(user).to receive(:save!).and_return(true)
      user.set_remember_token
      expect(user.remember_token).to_not be_blank
      expect(user.remember_token_created_at).to_not be_blank
    end

    it "clears the remember token" do
      user = User.new
      expect(user).to receive(:save!).and_return(true)
      user.remember_token = "TOKEN"
      user.remember_token_created_at = Time.now
      user.clear_remember_token
      expect(user.remember_token).to be_nil
      expect(user.remember_token_created_at).to be_nil
    end
  end

  describe "token expiry" do
    it "should expire reset password tokens" do
      user = User.new
      expect(user.reset_password_token_expired?).to eq(true)
      user.reset_password_token_created_at = 10.minutes.ago
      expect(user.reset_password_token_expired?).to eq(false)
      user.reset_password_token_created_at = 1.day.ago
      expect(user.reset_password_token_expired?).to eq(true)
    end

    it "should expire confirmation tokens" do
      user = User.new
      expect(user.confirmation_token_expired?).to eq(true)
      user.confirmation_token_created_at = 2.days.ago
      expect(user.confirmation_token_expired?).to eq(false)
      user.confirmation_token_created_at = 3.days.ago
      expect(user.confirmation_token_expired?).to eq(true)
    end

    it "should expire remember tokens" do
      user = User.new
      expect(user.remember_token_expired?).to eq(true)
      user.remember_token_created_at = 30.days.ago
      expect(user.remember_token_expired?).to eq(false)
      user.remember_token_created_at = 1.years.ago
      expect(user.remember_token_expired?).to eq(true)
    end
  end

  describe "display name" do
    it "has a display name" do
      user = User.new(first_name: "Boss", last_name: "Hogg")
      expect(user.full_name).to eq("Boss Hogg")
      user.first_name = nil
      expect(user.full_name).to eq("Hogg")
    end
  end

  describe "tracking" do
    let(:user) do
      user = User.new
      expect(user).to receive(:save).and_return(true)
      user
    end

    it "tracks sign in count" do
      expect {
        user.track_sign_in(nil)
      }.to change(user, :sign_in_count).by(1)
    end

    it "tracks current sign in" do
      allow(Time).to receive(:now).and_return(time = Time.now)
      user.track_sign_in(nil)
      expect(user.current_sign_in_at).to eq(time)
    end

    it "tracks last sign in" do
      time = Time.now
      user.current_sign_in_at = time
      user.track_sign_in(nil)
      expect(user.last_sign_in_at).to eq(time)
    end

    it "tracks current and last ip" do
      user.track_sign_in(ip = "123.456.789.001")
      expect(user.current_sign_in_ip).to eq(ip)
    end

    it "tracks current and last ip" do
      ip = "123.456.789.001"
      user.current_sign_in_ip = ip
      user.track_sign_in(nil)
      expect(user.last_sign_in_ip).to eq(ip)
    end
  end

  describe "emails" do
    let(:user) { FactoryGirl.build(:user) }

    describe "with valid params" do
      it "confirms the email" do
        user = User.new
        expect(user).to receive(:save!).and_return(true)
        allow(Time).to receive(:now).and_return(time = Time.now.to_i)

        user.send_confirmation
        expect(user.confirmation_token_created_at.to_i).to eq(time)
        expect(user.confirmation_token).to_not be_blank
      end

      it "generates a token before it sends confirmation email instructions" do
        user = User.new
        expect(user).to receive(:save!).and_return(true)
        user.send_confirmation
        expect(user.confirmation_token).to_not be_blank
        expect(user.confirmation_token_created_at).to_not be_blank
      end

      it "sends confirmation email instructions" do
        user = User.new
        expect(user).to receive(:save!).and_return(true)
        user.send_confirmation
      end

      it "handles confirmed emails" do
        expect(user).to receive(:save).and_return(true)
        user.confirmation_email = "new@example.com"
        user.confirmation_token = "TOKEN"
        expect(user.email_confirmed).to eq(true)
        expect(user.confirmation_email).to eq(user.email)
        expect(user.confirmation_token).to be_nil
        expect(user.confirmation_token_created_at).to be_nil
        expect(user.email).to eq("new@example.com")
      end
    end

    it "does not confirm if there is no confirmation token" do
      user.confirmation_email = "new@example.com"
      user.confirmation_token = nil
      expect(user.email_confirmed).to eq(false)
    end

    it "does not confirm if there is no confirmation email" do
      user.confirmation_email = ""
      user.confirmation_token = "TOKEN"
      expect(user.email_confirmed).to eq(false)
    end

    it "does not confirm emails if they are already used" do
      FactoryGirl.create(:user, email: "new@example.com")
      user.confirmation_email = "new@example.com"
      user.confirmation_token = "TOKEN"
      expect(user.email_confirmed).to eq(false)
      expect(user.errors[:email].size).to eq(1)
    end

    it "is pending confirmation if there is a confirmation token" do
      user = FactoryGirl.build(:user, confirmation_token: "TOKEN")
      expect(user).to be_pending_confirmation
    end

    it "there is no pending confirmation if there is not a confirmation token" do
      user = FactoryGirl.build(:user, confirmation_token: nil)
      expect(user).to_not be_pending_confirmation
    end
  end

  describe "passwords" do
    it "changes the password if it matches" do
      user = FactoryGirl.build(:user)
      expect(user).to receive(:save).and_return(true)
      user.change_password("password", "password")
      expect(user.password_digest).to_not be_blank
      expect(user.remember_token).to be_nil
      expect(user.remember_token_created_at).to be_nil
    end

    it "doesn't change the password if it doesn't match" do
      user = User.new
      user.remember_token = "token"
      user.change_password("password", "typotypo")
      expect(user).to_not be_valid
      expect(user.remember_token).to eq("token")
    end

    it "resets the password" do
      user = User.new
      expect(user).to receive(:save!).and_return(true)
      allow(Time).to receive(:now).and_return(time = Time.now)

      user.send_reset_password
      expect(user.reset_password_token_created_at).to eq(time)
      expect(user.reset_password_token).to_not be_blank
    end

    it "generates a token before it sends reset password instructions" do
      user = User.new
      expect(user).to receive(:save!).and_return(true)
      user.send_reset_password
      expect(user.reset_password_token).to_not be_blank
      expect(user.reset_password_token_created_at).to_not be_blank
    end

    it "sends reset password instructions" do
      user = User.new
      expect(user).to receive(:save!).and_return(true)
      user.send_reset_password
    end
  end
end
