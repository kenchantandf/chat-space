class MessagesController < ApplicationController
  before_action :set_group, :set_groups, :set_messages

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(create_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      flash.alert = 'メッセージを入力してください。'
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
    params.require(:message).permit(:text).merge(group_id: params[:group_id])
  end


end
