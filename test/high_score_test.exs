defmodule HighScoreTest do
  use ExUnit.Case
  doctest HighScore

  test "Define a new high score map" do
    assert HighScore.new() == %{}
  end

  test "Add one player without score to a empty score map" do
    scores = HighScore.new()
    assert HighScore.add_player(scores,"Wagner Souza") == %{"Wagner Souza" => 0}
  end

  test "Add two players without score to a empty score map" do
    scores = HighScore.new()
    |> HighScore.add_player("Wagner Souza")
    |> HighScore.add_player("Raissa Souza")

    assert scores == %{"Wagner Souza" => 0, "Raissa Souza" => 0}
  end

  test "Add player with score to empty score map" do
    scores = HighScore.new()
    |> HighScore.add_player("João Silva", 10)

    assert scores == %{"João Silva" => 10}
  end

  test "Add two players with score to empty score map" do
    scores = HighScore.new()
    |> HighScore.add_player("Maria", 8)
    |> HighScore.add_player("José", 3)

    assert scores == %{"Maria" => 8, "José" => 3}
  end

  test "Remove from a empty score map results in empty score map" do
    scores = HighScore.new()
    |> HighScore.remove_player("wagner")

    assert scores == %{}
  end

  test "Remove player after adding results in empty score map" do
    scores = HighScore.new()
    |> HighScore.add_player("wagner",9)
    |> HighScore.remove_player("wagner")

    assert scores = %{}
  end

  test "Remove first player after adding two results in map with remaining player" do
    scores = HighScore.new()
    |> HighScore.add_player("wagner")
    |> HighScore.add_player("Raissa")
    |> HighScore.remove_player("wagner")

    assert scores == %{"Raissa" => 0}
  end

  test "Remove second player after adding two results in map with remaining player" do
    scores = HighScore.new()
    |> HighScore.add_player("wagner")
    |> HighScore.add_player("raissa")
    |> HighScore.remove_player("raissa")

    assert scores == %{"wagner" => 0}
  end

  test "Reset score for existing player sets previous player score to 0" do
    scores = HighScore.new()
    |> HighScore.reset_score("wagner")

    assert scores == %{"wagner" => 0}
  end

  test "Resetting score for existing player sets previous player score to 0" do
    scores = HighScore.new()
    |> HighScore.add_player("wagner", 32)
    |> HighScore.reset_score("wagner")

    assert scores == %{"wagner" => 0}
  end

  test "Update score for a non existent player initializes value" do
    scores = HighScore.new()
    |> HighScore.update_score("wagner", 10)

    assert scores == %{"wagner" => 10}
  end

  test "Update score for existing player adds score to previous" do
    scores = HighScore.new()
    |> HighScore.add_player("wagner", 2)
    |> HighScore.update_score("wagner", 4)

    assert scores == %{"wagner" => 6}
  end

  test "Update score for existing player with non-zero score adds score to previous" do
    scores = HighScore.new()
    |> HighScore.add_player("wagner")
    |> HighScore.add_player("wagner", 22)
    |> HighScore.update_score("wagner", 3)

    assert scores == %{"wagner" => 25}
  end

  test "Empty score map gives empty list" do
    scores = HighScore.new()
    |> HighScore.get_players()

    assert scores == []
  end

  test "Score map with one entry gives one result" do
    scores = HighScore.new()
    |> HighScore.add_player("Maria", 33)
    |> HighScore.get_players()

    assert scores == ["Maria"]
  end

  test "Score map with multiple entries gives results in unknown order" do
    scores = HighScore.new()
    |> HighScore.add_player("maria")
    |> HighScore.add_player("joão")
    |> HighScore.add_player("josé")
    |> HighScore.get_players()
    |> Enum.sort()

    assert scores == ["josé", "joão", "maria"]
  end
end
