defmodule ElixirTweet.Scheduler do
    def schedule_file(schedule, filepath) do
        Quantum.add_job(schedule, fn ->
            ElixirTweet.FileReader.get_strings_to_tweet(filepath)
            |> ElixirTweet.TweetServer.tweet()
            end)
    end
end