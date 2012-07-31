class ContactForm
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :email, :body

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :name, :email, :body
  validates_format_of :email, with: EMAIL_REGEX

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end