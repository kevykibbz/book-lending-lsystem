class User < ApplicationRecord
    has_secure_password
    has_many :sessions, dependent: :destroy
    has_many :borrowings
    has_many :borrowed_books, through: :borrowings, source: :book
    
    normalizes :email, with: ->(e) { e.strip.downcase }
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
  
    # Custom validation to ensure password and password_confirmation match
    validate :password_match
  
    validate :name_does_not_contain_numbers
  
    # Add fields for password reset
    attr_accessor :reset_password_token, :reset_password_sent_at

    def reset_password_period_valid?
        reset_password_sent_at && reset_password_sent_at > 2.hours.ago
    end

    private
  
    def password_match
      if password != password_confirmation
        errors.add(:password_confirmation, "doesn't match Password")
      end
    end
  
    def name_does_not_contain_numbers
      if full_name.present? && full_name.match?(/\d/)
        errors.add(:full_name, "should not contain numbers")
      end
    end
end
  