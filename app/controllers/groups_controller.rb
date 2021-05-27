class GroupsController < ApplicationController
  
  def index
    @groups = Group.all.order(:name)
  end
  
  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = current_user.groups.build(group_params)
    if group.save
      redirect_to @groups
    else
      render :new
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render 'edit'
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, :user)
  end
end