class Loan < ApplicationRecord
  belongs_to :user

  after_save :update_balance
  before_save :update_status
  validate :loan_amount

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

  def loan_amount
    case user.user_type
    when 'basic'
      if self.amount > 1000
        errors.add(:amount, "must be less then 1000")
      end
    when 'silver'
      if self.amount > 1500
        errors.add(:amount, "must be less then 1500")
      end
    when 'gold'
      if self.amount > 2000
        errors.add(:amount, "must be less then 2000")
      end
    else
      account = Account.first
      if self.amount > account.amount
        errors.add(:amount, "must be less then total amount")
      end
    end
  end
end
