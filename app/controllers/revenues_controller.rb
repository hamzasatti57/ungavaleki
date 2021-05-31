class RevenuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_revenue, only: %i[ show edit update destroy ]

  def index
    @revenues = Revenue.all
  end

  def show; end

  def new
    @revenue = Revenue.new
  end

  def edit; end

  def create
    @revenue = Revenue.new(revenue_params)

    respond_to do |format|
      if @revenue.save
        format.html { redirect_to revenues_url, notice: "Revenue was successfully created." }
        format.json { render :show, status: :created, location: @revenue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @revenue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @revenue.update(revenue_params)
        format.html { redirect_to revenues_url, notice: "Revenue was successfully updated." }
        format.json { render :show, status: :ok, location: @revenue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @revenue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @revenue.destroy
    respond_to do |format|
      format.html { redirect_to revenues_url, notice: "Revenue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_revenue
    @revenue = Revenue.find(params[:id])
  end

  def revenue_params
    params.require(:revenue).permit(:name, :amount)
  end
end
