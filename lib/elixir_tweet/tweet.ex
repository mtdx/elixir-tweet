defmodule ElixirTweet.Tweet do
    def send(text) do
        ExTwitter.configure(:process,
            [consumer_key: System.get_env("ELIXIR_TWEET_TWITTER_CONSUMER_KEY"),
            consumer_secret: System.get_env("ELIXIR_TWEET_TWITTER_CONSUMER_SECRET"),
            access_token: System.get_env("ELIXIR_TWEET_TWITTER_ACCESS_TOKEN"),
            access_token_secret: System.get_env("ELIXIR_TWEET_TWITTER_ACCESS_SECRET")])

        extwitter.update(text) 
    end

    def send_random(path) do
        ElixirTweet.FileReader.get_strings_to_tweet(path)
        |> send
    end
end