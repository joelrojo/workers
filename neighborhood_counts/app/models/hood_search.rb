class HoodSearch < ActiveRecord::Base
  validates_presence_of :term

  include TweetFiles

  def self.hoods
    [
      "Manhattan",
      "Queens",
      "Bronx",
      "Brooklyn",
      "Staten Island"
    ]
  end

  def complete?
    files == TweetFiles::FILENAMES.length
  end
end
