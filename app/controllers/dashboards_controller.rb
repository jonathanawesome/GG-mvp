class DashboardsController < ApplicationController

  before_filter :authenticate_user!

  def display
    if current_user
      @events = current_user.events
      @signups = current_user.signups
    end
  end

  def avatar
    @user = User.find(current_user.id)
  end

  def update_avatar
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      redirect_to request.referrer, flash: { success: "Your avatar was successfully updated" }
    else
      redirect_to request.referrer, flash: { warning: "The following error(s) occurred: #{@user.errors.full_messages}"}
    end
  end

end