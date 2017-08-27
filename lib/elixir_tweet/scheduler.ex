defmodule ElixirTweet.Scheduler do
    def schedule_file(schedule, filepath) do
        Quantum.add_job(schedule, fn ->
            gElixirTweet.FileReader.get_strings_to_tweet(filepath)
            |> ElixirTweet.TweetServer.tweet()
            end)
    end
end