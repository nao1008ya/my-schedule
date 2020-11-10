class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = current_user.groups
  end
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  def edit
    if @group.users.include?(current_user)
      render :edit
    else
      redirect_to root_path
    end
  end
  def update
    if @group.update(group_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end


  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
