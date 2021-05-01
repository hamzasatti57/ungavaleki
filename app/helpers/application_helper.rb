module ApplicationHelper

  def child_users id
    if id.blank?
      User.where(role: 'user', parent_id: nil)
    else
      User.where("role = 'user' OR parent_id = #{id}")
    end
  end

  def get_boolean_value(value)
    value ? 'Yes' : 'No'
  end
end
