class ContributionsController < ApplicationController

  def index
    return if current_user.expenses.size.zero?

    @contributions = current_user.contribution.desc.select { |contri| contri.groups.exists? }
  end


  def external
    return if current_user.expenses.size.zero?

    @expenses = current_user.expenses.desc.reject { |expense| expense.groups.exists? }
  end

  
  def new
    @contribution = Contribution.new
    @groups = current_user.groups
  end

  def create
    @contribution = current_user.contribution.build(contribution_params) 
    @group = Group.find_by(id: group_params[:group_id])
    @contribution.groups << @group unless @group.nil?

    if @contribution.save
      flash[:success] = 'Contribution added'
      redirect_to contribution_path
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