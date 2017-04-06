class MessagesController < ApplicationController
  before_action :set_group, :set_groups

  def index
    @messages = @group.messages
  end

  private

  def set_groups
    @groups = current_user.groups
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
