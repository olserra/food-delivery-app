require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    # 1. ask for username
    username = @sessions_view.ask_for(:username)
    # 2. ask for password
    password = @sessions_view.ask_for(:password)
    # 3. find the user in repo
    employee = @employee_repository.find_by_username(username)

    if employee && employee.valid_password?(password)
      @sessions_view.successfull_login
      return employee
    else
      # say to user to try again
      @sessions_view.wrong_credentials
      # try again
      login #recursive call
    end
    # 4. check if password is correct
  end

  def logout
  end
end