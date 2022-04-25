namespace :thing do
  task :add_apple_to_basket, [:variety, :apple_count] do |task, args|
  basket_no_apple = Basket.filter_by_no_apple
  basket_with_atleast_apple = Basket.filter_by_atleast_apple
  apple_count.times.each do |app_count|
    basket = Basket.where(Basket.arel_table[:fill_rate].gt(100)).first if !(basket && basket.fill_rate < 100)
     if basket.present?
      apple = Apple.create(variety: variety, basket_id: basket.id)
      basket = apple.basket  
    else
      Rails.logger.info "All baskets are full. we couldn't find the place for #{apple_count - app_count } apples"
      break
    end
   end
  end
end