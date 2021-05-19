class LoanReturnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[pay_to_admin loan_received]
  def index
    if current_user.role.in? ['admin', 'super_admin', 'account_manager']
      @loans = Loan.where(admin_pay: true).all
    else
      @loans = current_user.loans.where(admin_pay: true, admin_received: false).all
    end
  end

  def pay_to_admin
    if @loan.update(user_pay: true)
      @loan.update(actual_return: Date.today)
      LoanMailer.loan_return(@loan.user).deliver
      redirect_to loan_returns_url, notice: "User returned loan successfully"
    end
  end

  def loan_received
    if @loan.update(admin_received: true)
       account = Account.first
      remaining_amount = account.amount + @loan.amount
      account.update(amount: remaining_amount)
      redirect_to loan_returns_url, notice: "Admin received loan successfully"
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end
end
