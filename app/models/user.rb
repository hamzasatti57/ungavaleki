class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

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
end
