defmodule FileReaderTest do
    use ExUnit.Case
    import ElixirTweet.FileReader
    import Mock

    doctest ElixirTweet.FileReader

    test "Passing a file should return a string" do
        str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:elixir_tweet)}", "sample.txt"))

        assert str != nil
    end

    @tag watch: true
    test "Will not return a string longer than 140 characters" do
        str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:elixir_tweet)}", "/test/too_long.txt"))

        assert str == "short line"
    end

    @tag watch: true
    test "An empty string should return an empty string" do
        with_mock File, [read!: fn(_) -> "" end] do
            assert get_strings_to_tweet("emptyfile.txt") == ""
        end
    end

    test "The string should be trimmed" do
        with_mock File, [read!: fn(_) -> " ABC " end] do
            str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:elixir_tweet)}", "not there.txt"))

            assert str == "ABC"
        end
    end

    test_with_mock "A random item should be returned from the file", File, [read!: fn(_) -> "ABC" end] do
        str = get_strings_to_tweet(Path.join("#{:code.priv_dir(:elixir_tweet)}", "does not exist.txt"))

        assert str == "ABC"
    end
end