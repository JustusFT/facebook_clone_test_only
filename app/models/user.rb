class User < ActiveRecord::Base
  has_secure_password
  has_many :statuses, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates_presence_of :email, :name, :password_confirmation
  validates_uniqueness_of :email, :case_sensitive => true
  validates_confirmation_of :password
  validate :has_valid_email
  validates_length_of :password, minimum: 6, maximum: 20

  def has_valid_email
    if (self.email =~ /\w+@\w+.\w+/).nil?
      self.errors.add(:email, "must be a valid email address")
    end
  end
end
