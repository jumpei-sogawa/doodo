class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def self.search(search)
  #   return self.all unless search
  #   self.where(['content LIKE ?', "%#{search}%"])
  # end
end
