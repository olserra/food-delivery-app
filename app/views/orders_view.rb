require 'pry-byebug'

class OrdersView
  def show_orders(orders)
    orders.each do |order|
      # byebug
      puts "##{order.id}. #{order.meal.name} - #{order.customer.name}"
    end
  end
end