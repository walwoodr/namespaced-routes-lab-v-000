class Preference < ActiveRecord::Base
  validates :artist_sort_order, inclusion: {in: ["ASC", "DESC"]}
  validates :song_sort_order, inclusion: {in: ["ASC", "DESC"]}
  validates :allow_create_artists, inclusion: { in: [true, false]}
  validates :allow_create_songs, inclusion: { in: [true, false]}
  after_initialize :set_defaults, if: :no_id?

  def set_defaults
    self.artist_sort_order ||= "DESC"
    self.song_sort_order ||= "DESC"
    self.allow_create_songs ||= false
    self.allow_create_artists ||= false
  end

  def no_id?
    self.id.nil?
  end

  def display_alerts
    if self.errors.nil?
      "There are no known errors. Try refreshing the page and resubmitting your changes."
    else
      self.errors.full_messages.join(", and ")
    end
  end

end
