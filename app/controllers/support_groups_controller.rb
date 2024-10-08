class SupportGroupsController < ApplicationController

  def index
    @support_groups = current_user.support_groups
  end
  
  def new
    @support_group = SupportGroup.new
  end

  def create
    @support_group = current_user.support_groups.build(support_group_params)
    if @support_group.save
      redirect_to user_path(current_user), notice: 'Support group created successfully.'
    else
      render :new
    end
  end

  def destroy
    @support_group = current_user.support_groups.find(params[:id])
    @support_group.destroy
    redirect_to user_path(current_user), notice: 'Support group deleted.'
  end

  private

  def support_group_params
    params.require(:support_group).permit(:name)
  end
end
