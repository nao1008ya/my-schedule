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
    num = 0
    @group.group_users.each do |user|
      if user.user_id == current_user.id
        num += 1
      end
    end
    if num == 1
      render :edit
    else
      redirect_to root_path
    end
  end
  def update
    if @gruop.update(group_params)
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
