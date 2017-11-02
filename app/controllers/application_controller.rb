class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  # def customer?
  #   flash[:notice] = "Sorry. You are not allowed to perform this action."
  #   return redirect_back(fallback_location: root_path), notice: "Sorry. You do not have the permissino to verify a property."
  # end
  #
  # def moderator?
  #   flash[:notice] = "Sorry. You are not allowed to perform this action."
  #   return redirect_back(fallback_location: root_path), notice: "Sorry. You do not have the permissino to verify a property."
  # end
  #
  # def superadmin?
  #   flash[:notice] = "Sorry. You are not allowed to perform this action."
  #   return redirect_back(fallback_location: root_path), notice: "Sorry. You do not have the permissino to verify a property."
  # end

  def allowed?(action:, user:)
    if action == 'for_customer' && user.role == 'customer'
      return true
    elsif action == 'for_moderator' && user.role == 'moderator'
      return true
    elsif action == 'for_superadmin' && user.role == 'superadmin'
      return true
    elsif action == 'for_superadmin_moderator' && user.role != 'customer'
      return true
    elsif action == 'for_superadmin_customer' && user.role != 'moderator'
      return true
    else
      flash[:notice] = "Sorry. You are not allowed to perform this action."
      return false
      # return redirect_back(fallback_location: root_path), notice: "Sorry. You do not have the permissino to verify a property."
    end
  end
end
