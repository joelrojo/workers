Tweets can be downloaded here: https://s3.amazonaws.com/dimroc-public/interviews/tweets.zip

Place them under `app/db/tweets/`

### Files

```
tweets_aa
tweets_ab
tweets_ac
```

### Sample

```
Manhattan	Depue lo otro se puede ih al diabloooo
Staten Island	@Detresss I was going for them
Brooklyn	my dad and brother singing to kelly clarkson i love it😂😂
```

### First Task

Find out how many times each borough says the term `knicks`.
Then we can deduce if people actually care about the New York Knicks.

### Results

```ruby
{
  "Manhattan"=>476,
  "Queens"=>323,
  "Brooklyn"=>314,
  "Bronx"=>300,
  "Staten Island"=>96
}
```

### Second Task

Use the boilerplate Rails application to create a webpage that allows you to do the first task.
Generically speaking, build out a webpage that allows one to search neighborhoods for term frequencies.

The boilerplate is [here](neighborhood_counts).

### Sideqik Requirements
- Redis installed and running locally
-- use homebrew to install
-- run with `redis-server`
-- clear with `redis-cli flushall`
- Sidekiq (`bundle exec sidekiq`)
