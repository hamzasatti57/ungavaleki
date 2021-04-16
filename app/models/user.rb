class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :registerable
  devise :database_authenticatable,
         :rememberable, :validatable

  enum user_type: {
    "basic": "Basic – R 1000",
    "silver": "Silver – R 1500",
    "gold": "Gold – R 2000",
    "plug_basic": "PlugBasic – R 1000",
    "plug_silver": "PlugSilver – R 1500",
    "plug_gold": "PlugGold – R 2000"
  }

  def account_manager?
    role == 'account_manager'
  end

  def admin?
    role == 'admin'
  end

  def super_admin?
    role == 'super_admin'
  end

  def plug_user?
    role == 'plug_user'
  end

  def simple_user?
    role == 'simple_user'
  end

  def full_name
    [first_name, last_name].select(&:present?).join(' ').titleize
  end

end
