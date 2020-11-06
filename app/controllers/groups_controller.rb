class GroupsController < ApplicationController
  def index
    
  end
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :index
    else
      render :new
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to :index
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
