defmodule ElixirTweet.FileReader do
    def get_strings_to_tweet(filename) do
        File.read!(filename)
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 140)
        |> Enum.random()
    end
end