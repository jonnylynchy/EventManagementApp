class User < ActiveRecord::Base
  attr_accessible :church_id, :city, :email, :first_name, :home_phone, :last_name, :mobile_phone, :organization_id, :postal_code, :state, :street_address
  attr_accessor :password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  #associations
  belongs_to :organization
  belongs_to :church 
  has_many :children
  has_many :user_registrations

  #validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :home_phone
  validates_presence_of :mobile_phone
  validates_uniqueness_of :email
  validates_format_of :email, with: EMAIL_REGEX
  validates_presence_of :organization

  # only on create, so other attributes of this user can be changed
  validates_length_of :password, within: 6..25, on: :create
  
  before_save :create_hashed_password
  after_save :clear_password

  def self.authenticate(email="", password="")
    user = User.find_by_email(email)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end

  def self.make_salt(email="")
    Digest::SHA1.hexdigest("Use #{email} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private
  def create_hashed_password
    #whenever :password has a value, hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = User.make_salt(email) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end

end
