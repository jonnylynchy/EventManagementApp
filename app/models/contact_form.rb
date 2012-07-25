class ContactForm
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :email, :body
  validates_presence_of :name, :email, :body

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end