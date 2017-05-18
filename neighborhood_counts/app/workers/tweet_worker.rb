class TweetWorker
  include Sidekiq::Worker
  include TweetFiles
  def perform(hood_search_id, term)
    TweetFiles::FILENAMES.each do |filename|
      IndividualTweetWorker.perform_async(hood_search_id, filename)
    end
  end
end

class IndividualTweetWorker
  include Sidekiq::Worker
  def perform(hood_search_id, filename)
    results = Hash.new(0)
    hood_search = HoodSearch.find(hood_search_id)

    IO.foreach("#{Rails.root}/db/tweets/#{filename}") do |x|
      borough, message = x.split("\t")
      if message.downcase.include?(hood_search.term)
        results[borough.downcase.tr(" ", "_")] += 1
      end
    end

    results.each do |key, value|
      HoodSearch.connection.execute(
        "UPDATE hood_searches SET #{key} = COALESCE(#{key}, 0) + #{value} WHERE id = #{hood_search.id}"
      )
    end
    HoodSearch.increment_counter(:files, hood_search.id)
  end
end