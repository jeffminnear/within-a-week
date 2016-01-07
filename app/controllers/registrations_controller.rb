class RegistrationsController < Devise::RegistrationsController

  def sign_up(resource_name, resource)
    flash[:event] = "User Registers"
    super
  end
end
