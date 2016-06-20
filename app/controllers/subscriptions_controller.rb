class SubscriptionsController < ApplicationController
  before_action :set_playlist, only: [:create]
  before_action :set_arcade_machine, only: [:create]
  before_action :permission_check!

  def create
    Subscription.find_or_create_by playlist: @playlist, arcade_machine: @arcade_machine
    redirect_to playlists_path, notice: "Subscribed to #{@playlist.title}"
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to playlists_path, notice: "Unsubscribed from #{@subscription.playlist.title}." }
      format.json { head :no_content }
    end
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end

  def set_arcade_machine
    @arcade_machine = ArcadeMachine.find(params[:arcade_machine_id])
  end

  def permission_check!
    require_admin_or_ownership!(@arcade_machine)
  end

end