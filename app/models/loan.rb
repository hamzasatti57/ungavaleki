class Loan < ApplicationRecord
  belongs_to :user
  # before_save :update_status
  after_save :update_interest
  validate :loan_amount
  after_create :update_expected_amount
  validate :loan_value, :on => :create

  def loan_value
    if user.loans.where(admin_received: false).any?
      errors.add(:loan, "already in progress.")
    end
  end

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

  def update_interest
    return if loan_date.blank?
    return if !admin_received
    days = (actual_return - loan_date).to_i
    days = days == 0 ? 1 : days
    if days <= 7
      interest_value = amount * 0.1
    elsif days > 7
      interest_value = amount * 0.2
    elsif days > 14
      interest_value = amount * 0.3
    elsif days > 21
      interest_value = amount * 0.4
    end
    account = Account.first
    rev = interest_value * 0.4
    why_not = interest_value * 0.1
    plug = interest_value * 0.2
    time_stamp = interest_value * 0.1
    oper = interest_value * 0.1
    nonsense = interest_value * 0.1

    account.update(revenue: account.revenue + rev, why_not: account.why_not + why_not, plug: account.plug + plug, time_stamp: account.time_stamp + time_stamp, operation: account.operation + oper, nonsense: account.nonsense + nonsense)
  end

  def update_expected_amount
    case self.expected_return
    when '1 week'
      interest_value = amount * 0.1
    when '2 weeks'
      interest_value = amount * 0.2
    when '3 weeks'
      interest_value = amount * 0.3
    when '4 weeks'
      interest_value = amount * 0.4
    else
      interest_value = 0
    end
    update(expected_amount: amount + interest_value)
  end
end
