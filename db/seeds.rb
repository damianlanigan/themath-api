# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Doorkeeper::Application.where(
  name: 'HowAmIDoing',
  redirect_uri: 'https://api.HowAmIDoing.com',
  uid: ENV['DOORKEEPER_APP_UID'],
  secret: ENV['DOORKEEPER_APP_SECRET']
).first_or_create

#Seed 'core' categories
journal_category = JournalCategory.find_or_initialize_by(name: 'self')
journal_category.name = 'self'
journal_category.core = true;
journal_category.save!

journal_category = JournalCategory.find_or_initialize_by(name: 'lifestyle')
journal_category.name = 'lifestyle'
journal_category.core = true;
journal_category.save!

journal_category = JournalCategory.find_or_initialize_by(name: 'money')
journal_category.name = 'money'
journal_category.core = true;
journal_category.save!

journal_category = JournalCategory.find_or_initialize_by(name: 'health')
journal_category.name = 'health'
journal_category.core = true;
journal_category.save!

journal_category = JournalCategory.find_or_initialize_by(name: 'work')
journal_category.name = 'work'
journal_category.core = true;
journal_category.save!

journal_category = JournalCategory.find_or_initialize_by(name: 'live')
journal_category.name = 'live'
journal_category.core = true;
journal_category.save!