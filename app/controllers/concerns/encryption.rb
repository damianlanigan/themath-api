require 'active_support/concern'

module Encryption  
  extend ActiveSupport::Concern

  def data_encryption_key
    # if in production. require key to be set.
    if Rails.env.production?
      raise 'Must set data encryption key!!' unless ENV['DATA_KEY']
      ENV['DATA_KEY']
    else
      ENV['DATA_KEY'] ? ENV['DATA_KEY'] : 'super_secret_test_key'
    end
  end
end  