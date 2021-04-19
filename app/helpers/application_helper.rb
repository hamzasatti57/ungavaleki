module ApplicationHelper

  def child_users
    User.where(parent_id: nil)
  end
end
