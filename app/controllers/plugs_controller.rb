class PlugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plug, only: %i[ show edit update destroy ]

  def index
    @plugs = Plug.all
  end

  def show; end

  def new
    @plug = Plug.new
  end

  def edit; end

  def create
    @plug = Plug.new(plug_params)

    respond_to do |format|
      if @plug.save
        format.html { redirect_to plugs_url, notice: "Plug was successfully created." }
        format.json { render :show, status: :created, location: @plug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plug.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @plug.update(plug_params)
        format.html { redirect_to plugs_url, notice: "Plug was successfully updated." }
        format.json { render :show, status: :ok, location: @plug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plug.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @plug.destroy
    respond_to do |format|
      format.html { redirect_to plugs_url, notice: "Plug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_plug
    @plug = Plug.find(params[:id])
  end

  def plug_params
    params.require(:plug).permit(:name, :amount)
  end
end
