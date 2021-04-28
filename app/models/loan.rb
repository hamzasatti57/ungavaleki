class Loan < ApplicationRecord
  belongs_to :user

  after_save :update_balance
  before_save :update_status

  def update_status
    if plug_approval_changed? || admin_approval_changed?
      case user.role
      when "user"
        self.status = 'in-progress' if plug_approval
        self.status = 'approved' if admin_approval
      when plug_approval
        self.status = 'approved' if admin_approval
      end
    end
  end

  def update_balance
    if status == 'approved'
      account = Account.first
      remaining_amount = account.amount - self.amount
      account.update(amount: remaining_amount)
    end
  end
end
