class MessagesController < ApplicationController
  before_action :set_on_group, :set_on_groups

  def index
  end

  private

  def set_on_groups
    @groups = current_user.groups
  end

  def set_on_group
    @group = Group.find(params[:group_id])
  end

end
