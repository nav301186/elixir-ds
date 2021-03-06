defmodule DP.KVStore do

  def start_link do
    Agent.start_link(fn -> Map.new end, name: __MODULE__)
  end

  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  def get(key) do
    case Agent.get(__MODULE__, &Map.get(&1, key)) do
      nil -> {:error, :nil}
      value -> {:ok, value}
    end
  end
end
