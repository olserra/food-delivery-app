require 'pry-byebug'
require_relative 'base_repository'
require_relative '../models/order'

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_file)
  end

  def undelivered(employee) # its a employee instance
    @elements.select { |element| element.not_delivered? && element.employee == employee }
  end

  private

  def build_element(row)
    row[:id]    = row[:id].to_i     # Convert column to Fixnum
    row[:delivered] = row[:delivered] == 'true'  # Convert column to Fixnum

    # byebug
    meal = @meal_repository.find(row[:meal_id].to_i)
    employee = @employee_repository.find(row[:employee_id].to_i)
    customer = @customer_repository.find(row[:customer_id].to_i)

    row[:meal] = meal
    row[:employee] = employee
    row[:customer] = customer
    

    # { 
    #   id: an_id, 
    #   delivered: true/false, 
    #   meal: meal_obj,
    #   employee: employee_obj,
    #   customer: customer_obj
    # }
    Order.new(row)
  end
end