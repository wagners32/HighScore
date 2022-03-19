defmodule HighScore do
  @default_score 0

  @doc """"
    Create a new score map
  """
  def new() do
    %{}
  end

  @doc """"
    Add a player to score map
  """
  def add_player(scores, name, score \\ @default_score) do
    Map.put(scores, name, score)
  end

  @doc """"
    Remove a player from score map
  """
  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  @doc """"
    Reset score of a player
  """
  def reset_score(scores, name) do
    Map.put(scores, name, @default_score)
  end

  @doc """"
    Update score of a player
  """
  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn existing_value -> existing_value + score end)
  end

  @doc """"
    Get all players keys from a map
  """
  def get_players(scores) do
    Map.keys(scores)
  end
end
