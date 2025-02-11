ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # def sign_in(user)
  #   visit new_session_path
  #   fill_in "Enter your email address", with: user.email
  #   fill_in "Enter your password", with: "password"
  #   click_button "Sign in"
  # end

  def sign_in(user)
    post session_path, params: { email: user.email, password: "password" }
  end

  # Load seed data before each test
  setup do
    load Rails.root.join('db/test_seeds.rb')
  end
end
