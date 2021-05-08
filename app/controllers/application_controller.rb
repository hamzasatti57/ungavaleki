class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    sign_in_path
  end

  def authorize_user!
    if user_signed_in? && (current_user.role.in? ['plug_user', 'user'])
      flash[:alert] = "You have not authorize to this page."
      redirect_to root_path
    end
  end
end
