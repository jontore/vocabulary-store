class VocabsController < ApplicationController
  before_action :set_vocab, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :check_auth , :only => [:edit, :update, :destroy]

  # GET /vocabs
  # GET /vocabs.json
  def index
    @vocabs = Vocab.all().where(user_id: @user.id)
  end

  # GET /vocabs/1
  # GET /vocabs/1.json
  def show
  end

  # GET /vocabs/new
  def new
    @vocab = Vocab.new
  end

  # GET /vocabs/1/edit
  def edit
  end

  # POST /vocabs
  # POST /vocabs.json
  def create
    @vocab = Vocab.new({user_id: @user.id}.merge(vocab_params))

    respond_to do |format|
      if @vocab.save
        format.html { redirect_to action: 'index', notice: 'Vocab was successfully created.' }
        format.json { render :show, status: :created, location: @vocab }
      else
        format.html { render :new }
        format.json { render json: @vocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vocabs/1
  # PATCH/PUT /vocabs/1.json
  def update
    respond_to do |format|
      if @vocab.update(vocab_params)
        format.html { redirect_to action: 'index', notice: 'Vocab was successfully updated.' }
        format.json { render :show, status: :ok, location: @vocab }
      else
        format.html { render :edit }
        format.json { render json: @vocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabs/1
  # DELETE /vocabs/1.json
  def destroy
    @vocab.destroy
    respond_to do |format|
      format.html { redirect_to vocabs_url, notice: 'Vocab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_vocab
      puts 'set vocab'
      @vocab = Vocab.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def check_auth
      if @current_user.id != @vocab.user_id
        redirect_to user_vocabs_path(@user)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vocab_params
      params.require(:vocab).permit(:user_id, :reference_lang, :learning_lang)
    end
end
