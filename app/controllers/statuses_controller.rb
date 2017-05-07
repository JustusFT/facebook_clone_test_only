class StatusesController < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(strong_params)
    if @status.save
      flash[:notice] = "Status is created successfully."
      redirect_to @status
    else
      flash[:alert] = "Error creating status."
      render "new"
    end
  end

  def edit

  end

  def update
    @status = Status.find(params[:id])
    @status.update_attributes(strong_params)
    if @status.save
      flash[:notice] = "Status is updated successfully."
      redirect_to @status
    else
      flash[:alert] = "Error updating status."
      render "edit"
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    flash[:notice] = "Status is deleted."
    redirect_to "/statuses"
  end

  private
  def strong_params
    params.require(:status).permit(:title, :content)
  end
end
