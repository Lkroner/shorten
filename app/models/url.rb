require 'faker'

class Url < ActiveRecord::Base
  before_save :shorten_link

  def shorten_link
  	self.short_link = Faker::Lorem.characters(6)
  end 

end
