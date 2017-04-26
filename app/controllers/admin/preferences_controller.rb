class Admin::PreferencesController < ApplicationController

  def index
    @preference = Preference.new
  end

  def create
    @preference = Preference.new(preference_params)
    if @preference.save
      redirect_to admin_preferences_path
    else
      flash.now[:alert] = @preference.display_alerts
      render :index
    end
  end

  private

    def preference_params
      params.require(:preference).permit(:artist_sort_order,
                                         :song_sort_order,
                                         :allow_create_artists,
                                         :allow_create_songs)
    end

end
