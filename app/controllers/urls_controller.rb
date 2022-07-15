class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_url, only: :show
  before_action :set_own_url, only: [:edit, :destroy, :update]

  def index
    @urls = Url.includes(:user).page(params[:page]).per(5)
    @domain = request.base_url
  end

  def new
    @url = Url.new
  end

  def redirect
    @short_ext = params[:short_url]
    @url = Url.find_by(short_url: @short_ext)
    if @url.nil?
      not_found
    else
      @url.increment!(:count)
      redirect_to @url.long_url
    end
  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user
    if @url.save
      redirect_to urls_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @page=(Url.where('id < ?', params[:id]).size/5)+1
    if @url.update(url_params)
      redirect_to urls_path({:page=>@page})
    else
      render :edit
    end
  end

  def destroy
    if @url.destroy
      redirect_to urls_path
    end
  end

  def set_own_url
    @url = current_user.urls.find_by_id(params[:id])
    if @url.nil?
      flash[:alert] = 'this post not belongs_to you or not exists'
      redirect_to urls_path
    end
  end

  private

  def url_params
    params.require(:url).permit(:description)
  end

  def set_url
    @url = Url.find(params[:id])
  end

end
