module ControllerMacros
  def login(supporter)
    @request.env["devise.mapping"] = Devise.mappings[:supporter]
    sign_in supporter
  end
end