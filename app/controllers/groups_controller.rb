class GroupsController < ApplicationController

  before_action :set_on_group,except: [:new,:create]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
      if @group.save
         redirect_to root_path(@group),notice: 'グループの作成が完了しました。'
      else
        flash.now[:alert] = "グループの作成に失敗しました。"
        render :new
      end
  end

  def edit
  end

  def update
  end


private

  def set_on_group
    @group = Group.find(params[:id])
  end


  def group_params
    params.require(:group).permit(:name)
  end

end
