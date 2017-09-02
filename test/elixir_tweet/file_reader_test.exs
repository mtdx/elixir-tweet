defmodule FileReaderTest do
    use ExUnit.Case
    import ElixirTweet.FileReader

    test "Passing a file should return a string" do
        str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:elixir_tweet)}", "sample.txt"))

        assert str != nil
    end

    test "Will not return a string longer than 140 characters" do
        str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:elixir_tweet)}", "/test/too_long.txt"))

        assert str == "short line"
    end

    test "An empty string should return an empty string" do
        str = pick_string("")
        assert str == ""
    end
end