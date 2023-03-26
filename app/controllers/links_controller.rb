# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def show
    @link = Link.find_by(short_url_id: params[:short_url_id])
    redirect_to @link.original_url, allow_other_host: true
  end

  def create
    @link = Link.new(link_params)
    @link.short_url_id = Utils::ShortIdGenerator.generate

    if @link.save
      @short_url = "#{request.base_url}/#{@link.short_url_id}"
      flash.now.notice = 'Short URL has been created'
      render :index, status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
