module ApplicationHelper
  def app_nav(current_user)
    if logged_in?
      "<ul class = 'justify-content-end list-style-none col-md-8'>
          #{link_to 'Contributions', contributions_path, class: 'nav-item btn btn-light mx-2'}
          #{link_to 'Ungrouped Contributions', ungrouped_path, class: 'nav-item btn btn-light mx-2'}
          #{link_to 'Contribution Groups', groups_path, class: 'nav-item btn btn-light mx-2'}
          #{link_to 'Log Out', "/logout", class: 'navbar-right nav-item btn btn-danger mx-2 text-decoration-none'}
          #{link_to current_user.username, "/#",class: 'nav-item  fa fa-user btn btn-primary mx-2 '}
      </ul>".html_safe
    else
      "<ul class='d-flex justify-content-end list-style-none'>
        #{link_to 'Sign Up', new_user_path, class: 'navbar-right nav-item btn btn-light mx-2 text-decoration-none'}
        
        #{link_to 'Log In', "/login", class: 'navbar-right nav-item btn btn-light text-decoration-none'}
      </ul>".html_safe
    end
  end
  
end
