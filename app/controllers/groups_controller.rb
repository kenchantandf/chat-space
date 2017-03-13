class GroupsController < ApplicationController

  before_action :set_on_group, only: [:show, :edit, :update]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
      if @group.save
         redirect_to root_path(@group), notice: 'グループの作成が完了しました。'
      else
        flash.now[:alert] = 'グループの作成に失敗しました。'
        render :new
      end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'チャットグループが更新されました。'
    else
      flash.alert = 'チャットグループが更新できませんでした。'
      render :edit
    end
  end


  private

  def set_on_group
    @group = Group.find(params[:id])
  end


  def group_params
    params.require(:group).permit(:name)
  end

end
