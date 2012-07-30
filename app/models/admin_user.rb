class AdminUser < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :organization_id

  #associations
  belongs_to :organization

  attr_accessor :password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :organization
  validates_presence_of :first_name
  validates_length_of :first_name, maximum: 25
  validates_presence_of :last_name
  validates_length_of :last_name, maximum: 50
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :email, maximum: 100
  validates_format_of :email, with: EMAIL_REGEX
  validates_confirmation_of :email

  # only on create, so other attributes of this user can be changed
  validates_length_of :password, within: 8..25, on: :create

  before_save :create_hashed_password
  after_save :clear_password

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")

  def name
    "#{first_name} #{last_name}"     
  end

  def self.authenticate(email="", password="")
    user = AdminUser.find_by_email(email)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
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
      self.salt = AdminUser.make_salt(email) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end

end
