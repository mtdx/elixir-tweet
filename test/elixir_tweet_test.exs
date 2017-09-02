defmodule ElixirTweetTest do
  use ExUnit.Case
  doctest ElixirTweet

  test "the truth" do
    assert 1 + 1 == 2
  end

  @tag watching: true
  test "another truth" do
    assert 2 + 2 == 5
  end
end
