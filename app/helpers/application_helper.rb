module ApplicationHelper

  def child_users
    User.where(parent_id: nil, role: 'user')
  end

  def get_boolean_value(value)
    value ? 'Yes' : 'No'
  end
end
