module ContributionsHelper
  def show_contributions(name, contributions)
    render partial: name, locals: { obj: contributions } if contributions
  end

  def show_image(contribution)
    return unless contribution.groups.exists?

    "<div class='col-md-4'> #{image_tag(contribution.groups.first.image, class: 'group-img')}</div>".html_safe
  end
end
