class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[ show edit update destroy update_status admin_pay]

  def index
    @loans = Loan.all
  end

  def show; end

  def new
    @loan = Loan.new
  end

  def edit; end

  def create
    @loan = Loan.new(loan_params)
    @loan.user_id = current_user.id
    respond_to do |format|
      if @loan.save
        LoanMailer.loan_request(current_user).deliver
        format.html { redirect_to loans_url, notice: "Loan was successfully created." }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to loans_url, notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def admin_pay
    if @loan.user.bank_account.blank?
      return redirect_to loans_url, notice: "Bank account detail not present, please enter bank account details first."
    end
    if @loan.update(admin_pay: true)
      account = Account.first
      remaining_amount = account.amount - @loan.amount
      account.update(amount: remaining_amount)
      @loan.update(due_date: Date.today + 28.days, loan_date: Date.today)
      LoanMailer.loan_paid(@loan.user).deliver
      redirect_to loans_url, notice: "admin payed loan successfully"
    end
  end

  def update_status
    @loan.update("#{params[:type]}": true)
    redirect_to loans_url
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:description, :amount, :admin_approval, :plug_approval, :status, :user_id, :due_date)
  end
end
