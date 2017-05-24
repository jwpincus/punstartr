module ApplicationHelper

  def current_user_nav_element
    if current_user
      render "helpers/logged_in"
    else
      render "helpers/not_logged_in"
    end
  end

  def top_project_card
    if @top_project
      render "helpers/top_project"
    end
  end

end
