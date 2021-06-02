class ContributionsController < ApplicationController
  before_action :require_user

  def index
    return if current_user.contributions.size.zero?

    @contributions =  if params[:image]
                        current_user.contributions.includes(:groups).desc
                      else
                        current_user.contributions.includes(:groups).desc.select { |contribution| contribution.groups.exists? }
                      end
  end

  def ungrouped
    return if current_user.contributions.size.zero?

    @contributions = current_user.contributions.includes(:groups).desc.reject { |contribution| contribution.groups.exists? }
  end

  def new
    @contribution = Contribution.new
    @groups = current_user.groups
  end

  def create
    @contribution = current_user.contributions.build(contribution_params)
    @group = Group.find_by(id: group_params[:group_id])
    @contribution.groups << @group unless @group.nil?

    if @contribution.save
      flash[:success] = 'Contribution Added!'
      redirect_to contributions_path
    else
      flash.now[:error] = @contribution.errors.full_messages
      render :new
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:name, :amount)
  end

  def group_params
    params.require(:contribution).permit(:group_id)
  end
end
