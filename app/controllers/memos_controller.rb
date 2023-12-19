class MemosController < ApplicationController
  before_action :set_folder
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @memos = @folder.memos
  end

  def new
    @memo = @folder.memos.build
  end

  # GET /memos/1 or /memos/1.json
  def show
  end

  # GET /memos/1/edit
  def edit
  end

  def create
    # タイトルが空白の場合、自動的に「無題」を設定
    params[:memo][:title] = '無題' if params[:memo][:title].blank?
    @memo = @folder.memos.build(memo_params)

    if @memo.save
      redirect_to folder_memos_path(@folder), notice: 'Memo was successfully created.'
    else
      render :new
    end
  end


  def update
    # タイトルが空白の場合、自動的に「無題」を設定
    params[:memo][:title] = '無題' if params[:memo][:title].blank?
    
    if @memo.update(memo_params)
      redirect_to folder_memos_path(@folder), notice: 'Memo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /memos/1 or /memos/1.json
  def destroy
    @memo.destroy

    respond_to do |format|
      format.html { redirect_to memos_url, notice: "Memo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_folder
      @folder = Folder.find(params[:folder_id])
    end


    def set_memo
      @memo = @folder.memos.find(params[:id])
    end

    def memo_params
      params.require(:memo).permit(:title, :content)
    end
end
