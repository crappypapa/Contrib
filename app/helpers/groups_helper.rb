module GroupsHelper
  def show_groups(name, groups)
    render partial: name, locals: { obj: groups } if groups
  end

  def show_group_image(group)
    "<div class='col-sm-2'> #{image_tag(group.image, class: 'group-img')}</div>".html_safe if group.image.attached?
  end
end
