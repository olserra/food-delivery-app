class Order
  attr_reader :meal, :employee, :customer, :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
  end

  def delivered?
    @delivered == true
  end

  def not_delivered?
    !delivered?
  end
end