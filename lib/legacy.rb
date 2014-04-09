class Legacy < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "legacy_#{Rails.env}"

  #acts_as_importable
end