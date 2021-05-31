class WhyNotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_why_not, only: %i[ show edit update destroy ]

  def index
    @why_nots = WhyNot.all
  end

  def show; end

  def new
    @why_not = WhyNot.new
  end

  def edit; end

  def create
    @why_not = WhyNot.new(why_not_params)

    respond_to do |format|
      if @why_not.save
        format.html { redirect_to why_nots_url, notice: "Why not was successfully created." }
        format.json { render :show, status: :created, location: @why_not }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @why_not.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @why_not.update(why_not_params)
        format.html { redirect_to why_nots_url, notice: "Why not was successfully updated." }
        format.json { render :show, status: :ok, location: @why_not }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @why_not.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @why_not.destroy
    respond_to do |format|
      format.html { redirect_to why_nots_url, notice: "Why not was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_why_not
    @why_not = WhyNot.find(params[:id])
  end

  def why_not_params
    params.require(:why_not).permit(:name, :amount)
  end
end
