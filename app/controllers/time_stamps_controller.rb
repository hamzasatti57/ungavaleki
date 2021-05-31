class TimeStampsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_stamp, only: %i[ show edit update destroy ]

  def index
    @time_stamps = TimeStamp.all
  end

  def show; end

  def new
    @time_stamp = TimeStamp.new
  end

  def edit; end

  def create
    @time_stamp = TimeStamp.new(time_stamp_params)

    respond_to do |format|
      if @time_stamp.save
        format.html { redirect_to time_stamps_url, notice: "Time stamp was successfully created." }
        format.json { render :show, status: :created, location: @time_stamp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_stamp.update(time_stamp_params)
        format.html { redirect_to time_stamps_url, notice: "Time stamp was successfully updated." }
        format.json { render :show, status: :ok, location: @time_stamp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_stamp.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_stamp.destroy
    respond_to do |format|
      format.html { redirect_to time_stamps_url, notice: "Time stamp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_time_stamp
    @time_stamp = TimeStamp.find(params[:id])
  end

  def time_stamp_params
    params.require(:time_stamp).permit(:name, :amount)
  end
end
