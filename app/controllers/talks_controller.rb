class TalksController < ApplicationController
before_action:set_talk, only:[:show, :edit, :update, :destroy]
  def index
    @talks=Talk.all
  end

  def new
    if params[:back]
      @talk=Talk.new(talk_params)
    else
      @talk=Talk.new
    end
  end

  def confirm
    @talk=Talk.new(talk_params)
    @talk.valid?
  end

  def create
    @talk=Talk.new(talk_params)
    if @talk.save
       redirect_to talks_path, notice: "作成しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @talk.update(talk_params)
      redirect_to talks_path, notice:"編集しました"
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @talk.destroy
    redirect_to talks_path, notice:"削除しました！"
  end

  private

  def talk_params
    params.require(:talk).permit(:content)
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end
end
