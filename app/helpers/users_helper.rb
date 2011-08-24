module UsersHelper

  def toggle_label(user)
    if user.active
      "Inactivate"
    else
      "Activate"
    end
  end

end