class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token

  #  will convert entered email to downcase
  before_save :downcase_email
  # username validations
  validates :username, presence: true, uniqueness: true, length: {maximum: 50}

  # email validations
  VALID_EMAIL_REGEX = /.+\@.+\..+/
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 255}

  # password validations
  validates :password_digest, presence: true, length: {minimum: 6}
  has_secure_password

  # Associations
  has_many :favorites
  has_many :searches
  has_many :destinations, through: :searches

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  private
    def downcase_email
      self.email = email.downcase
    end


end
