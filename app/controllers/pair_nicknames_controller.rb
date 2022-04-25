class PairNicknamesController < ApplicationController
  before_action :set_pair_nickname, only: %i[ show edit update destroy ]

  # GET /pair_nicknames or /pair_nicknames.json
  def index
    @pair_nicknames = PairNickname.all.order(:name)
  end

  # GET /pair_nicknames/1 or /pair_nicknames/1.json
  def show
  end

  # GET /pair_nicknames/new
  def new
    @pair_nickname = PairNickname.new
  end

  # GET /pair_nicknames/1/edit
  def edit
  end

  # POST /pair_nicknames or /pair_nicknames.json
  def create
    @pair_nickname = PairNickname.new(pair_nickname_params)

    respond_to do |format|
      if @pair_nickname.save
        format.html { redirect_to pair_nickname_url(@pair_nickname), notice: "Pair nickname was successfully created." }
        format.json { render :show, status: :created, location: @pair_nickname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pair_nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pair_nicknames/1 or /pair_nicknames/1.json
  def update
    respond_to do |format|
      if @pair_nickname.update(pair_nickname_params)
        format.html { redirect_to pair_nickname_url(@pair_nickname), notice: "Pair nickname was successfully updated." }
        format.json { render :show, status: :ok, location: @pair_nickname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pair_nickname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pair_nicknames/1 or /pair_nicknames/1.json
  def destroy
    @pair_nickname.destroy

    respond_to do |format|
      format.html { redirect_to pair_nicknames_url, notice: "Pair nickname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pair_nickname
      @pair_nickname = PairNickname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pair_nickname_params
      params.require(:pair_nickname).permit(:pair_id, :name, :status)
    end
end
