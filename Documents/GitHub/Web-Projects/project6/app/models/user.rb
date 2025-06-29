class User < ApplicationRecord
    has_many :events
    has_many :evaluations, dependent: :destroy # added for evaluations
    has_many :presentations, dependent: :destroy # added for presentations
    
    before_save{self.email = email.downcase}
    
    validates :name, presence: true, length: {maximum:30}
    validates :email, presence: true,
              length: {maximum:50}, 
              uniqueness: true,
              format: {with: /\A\w+\.\d+@osu\.edu\Z/i}
    validates :password, presence:true, length: {minimum: 6}
    
    has_secure_password
    
    ROLE_OPTIONS = %w[student instructor].freeze
    validates :role, presence: true, inclusion: {in: ROLE_OPTIONS, message: "%{value} is not a valid role; valid roles are 'student' and 'instructor'"}

    attr_accessor :remember_token

  # Role-related methods
  def instructor?
    role == 'instructor'
  end

  def student?
    role == 'student'
  end

  # Token-related methods
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end