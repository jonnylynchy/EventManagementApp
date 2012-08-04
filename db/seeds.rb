# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Subscription Types
subscription_types = SubscriptionType.create([
	{
		title: 'Lite',
		description: 'This account type is free and allows you basic features to manage your events.',
		price: 0.00
	},
	{
		title: 'Standard',
		description: 'This account type includes many great features to help you manage your events.',
		price: 9.00
	},
	{
		title: 'Pro',
		description: 'The pro version includes all of our great features to automate so many of those repetitive tasks when managing events.',
		price: 25.00
	}
])

# Default Organization (for setup wizard, must have an organization to assign to AdminUser)
Organization.create(title: 'Light Post Events', contact_phone: '(214) 810-6399', contact_email: 'info@lightpostevents.com', description: 'Light Post Events', subdomain: 'default')