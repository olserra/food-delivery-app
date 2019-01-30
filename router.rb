class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.login

      while @employee
        if @employee.manager?
          print_manager_menu
          action = get_user_action
          do_manager_action(action)
        else
          print_delivery_guy_menu
          action = get_user_action
          do_delivery_guy_action(action)
        end
      end
    end
  end

  private

  def get_user_action
    puts 'What do you want to do next?'
    print '> '
    return gets.chomp.to_i
  end

  def print_manager_menu
    puts '1. Add a meal'
    puts '2. List available meals'
    puts '3. Add a customer'
    puts '4. List customers'
    puts '5. Logout'
    puts '6. Exit'
  end

  def do_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @employee = nil
    when 6 
      @employee = nil
      @running = false
    else
      puts 'Wrong action'
    end
  end


  def print_delivery_guy_menu
    puts '1. List orders'
    puts '2. Mark as delivered'
    puts '3. Logout'
    puts '4. Exit'
  end

  def do_delivery_guy_action(action)
    case action
    when 1 then puts @orders_controller.list(@employee)
    when 2 then puts 'TODO: Mark as delivered'
    else
      puts 'Wrong action'
    end
  end
end
