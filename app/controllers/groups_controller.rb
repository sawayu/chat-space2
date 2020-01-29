class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new (group_params)
    if @group.save
      redirect_to root_path, notice: "グループが作成されたよ！"
    else
      render :new
    end
  end

  def edit
    @group = Group.fint (params[:id])
  end

  def update
    @group = Group.find (params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループが変更されました！"
    end
      render :edit
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
