class GroupWatchlistsController < ApplicationController
  before_action :ensure_group_member, only: [:create]
  before_action :ensure_active, only: [:create]

  def create
    params[:group][:movie_ids].each do |movie_id|
      GroupWatchlist.create(group_id: params[:id], movie_id: movie_id)
    end
    redirect_to request.referrer
  end

  def destroy
    GroupWatchlist.destroy(params[:id].to_i)
    flash[:danger] = "Flick Removed From Watchlist"
    redirect_to request.referrer
  end

end
