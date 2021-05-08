module ApplicationHelper

  def child_users id
    if id.blank?
      User.where(role: 'user', parent_id: nil)
    else
      User.where("(role = 'user' AND parent_id is NULL) OR parent_id = #{id}")
    end
  end

  def get_boolean_value(value)
    value ? 'Yes' : 'No'
  end

  def get_admin?
    get_user =  User.where("role IN (?)", ['admin', 'super_admin', 'account_manager'])
    get_bank_account = BankAccount.where(user_id: get_user)
    if get_bank_account.any?
      true
    else
      false
    end
  end

  def loan_dues
    Loan.where("admin_pay = true AND user_pay = false AND due_date <= '#{Date.today}'")
  end

  def loan_over_dues
    Loan.where("admin_pay = true AND user_pay = false AND due_date > '#{Date.today}'")
  end
end
