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
    @memo = @folder.memos.build(memo_params)

    if @memo.save
      redirect_to folder_memos_path(@folder), notice: 'Memo was successfully created.'
    else
      render :new
    end
  end


  def update
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
