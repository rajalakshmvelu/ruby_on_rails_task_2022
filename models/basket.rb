class Basket < ApplicationRecord
  has_many :apples
  
  scope :filter_by_no_apple, -> {
    includes(:apples)
    .where("baskets.id NOT IN (SELECT DISTINCT(apples.basket_id) FROM apples)")
  }
  scope :filter_by_atleast_apple, -> {
   includes(:apples)
      .where("baskets.id IN (SELECT DISTINCT(apples.basket_id) FROM apples)")
  }
end