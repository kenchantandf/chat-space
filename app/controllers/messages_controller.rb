class MessagesController < ApplicationController
  before_action :set_on_group, only: [:index]

  def index
  end

  private

  def set_on_group
    # @group = Group.find(params[:group_id])
  end

end
