class CoinNicknamesController < ApplicationController
  before_action :set_coin_nickname, only: %i[ show edit update destroy ]

  # GET /coin_nicknames or /coin_nicknames.json
  def index
    @coin_nicknames = CoinNickname.all.order(:name)
  end

  # GET /coin_nicknames/1 or /coin_nicknames/1.json
  def show
  end

  # GET /coin_nicknames/new
  def new
    @coin_nickname = CoinNickname.new
  end

  # GET /coin_nicknames/1/edit
  def edit
  end

  # POST /coin_nicknames or /coin_nicknames.json
  def create
    @coin_nickname = CoinNickname.new(coin_nickname_params)

    respond_to do |format|
      if @coin_nickname.save
        format.html { redirect_to coin_nickname_url(@coin_nickname), notice: "Coin nickname was successfully created." }
        format.json { render :show, status: :created, location: @coin_nickname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin_nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coin_nicknames/1 or /coin_nicknames/1.json
  def update
    respond_to do |format|
      if @coin_nickname.update(coin_nickname_params)
        format.html { redirect_to coin_nickname_url(@coin_nickname), notice: "Coin nickname was successfully updated." }
        format.json { render :show, status: :ok, location: @coin_nickname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coin_nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coin_nicknames/1 or /coin_nicknames/1.json
  def destroy
    @coin_nickname.destroy

    respond_to do |format|
      format.html { redirect_to coin_nicknames_url, notice: "Coin nickname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin_nickname
      @coin_nickname = CoinNickname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_nickname_params
      params.require(:coin_nickname).permit(:coin_id, :name, :status)
    end
end
