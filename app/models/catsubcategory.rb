class Catsubcategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
end
