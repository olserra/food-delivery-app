require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repository)
    @order_repository = order_repository
    @orders_view = OrdersView.new
  end

  def list(employee)
    # 1. get orders from repo
    orders = @order_repository.undelivered(employee)
    # 2. show orders
    @orders_view.show_orders(orders)
    # 
  end

  def mark_complete(employee)
    # 1. ask what order id
    # 2. get undelivered orders
    # 3. find the correct id
    # 4. mark as complete
  end
end