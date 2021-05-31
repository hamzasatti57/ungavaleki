class NonSensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_non_sense, only: %i[ show edit update destroy ]

  def index
    @non_senses = NonSense.all
  end

  def show; end

  def new
    @non_sense = NonSense.new
  end

  def edit; end

  def create
    @non_sense = NonSense.new(non_sense_params)

    respond_to do |format|
      if @non_sense.save
        format.html { redirect_to non_senses_url, notice: "Non sense was successfully created." }
        format.json { render :show, status: :created, location: @non_sense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @non_sense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @non_sense.update(non_sense_params)
        format.html { redirect_to non_senses_url, notice: "Non sense was successfully updated." }
        format.json { render :show, status: :ok, location: @non_sense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @non_sense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @non_sense.destroy
    respond_to do |format|
      format.html { redirect_to non_senses_url, notice: "Non sense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_non_sense
    @non_sense = NonSense.find(params[:id])
  end

  def non_sense_params
    params.require(:non_sense).permit(:name, :amount)
  end
end
