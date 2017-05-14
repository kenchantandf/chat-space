class MessagesController < ApplicationController
  before_action :set_group, :set_groups, :set_messages

  def index
    @message = Message.new
      respond_to do |format|
        format.any
        format.json
      end
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group) }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages
  end

  def create_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
