class JnoodlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @jnoodle = Jnoodle.new
  end

  def create
    @jnoodle = current_user.jnoodles.build(jnoodle_params)
    if @jnoodle.save
      redirect_to jnoodle_path(@jnoodle), notice: "ラーメンを投稿しました。"
    else
      render :new
    end
  end

  def index
    @jnoodles = Jnoodle.all.order(id: "DESC")
  end

  def show
    @jnoodle = Jnoodle.find(params[:id])
  end

  def edit
    @jnoodle = Jnoodle.find(params[:id])
    if @jnoodle.user != current_user
        redirect_to jnoodles_path, alert: "禁止アクセスです。"
    end
  end

  def update
    @jnoodle = Jnoodle.find(params[:id])
    if @jnoodle.update(jnoodle_params)
      redirect_to jnoodle_path(@jnoodle), notice: "ラーメンを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    jnoodle = Jnoodle.find(params[:id])
    jnoodle.destroy
    redirect_to user_path(jnoodle.user), notice: "ラーメンを削除しました。"
  end

  private
  def jnoodle_params
    params.require(:jnoodle).permit(:title, :shop, :body, :image, :comment)
  end
end