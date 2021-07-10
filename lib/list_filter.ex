defmodule ListFilter do
  @moduledoc """
  Documentation for `ListFilter`.
  """

  import Integer

  def call(params) when is_list(params) and params != [] do
    params
    |> convert_to_integer()
    |> amount_odd()
  end

  def call([]), do: {:error, "empty list "}
  def call(_), do: {:error, "not is list "}

  defp convert_to_integer(params) do
    Enum.flat_map(params, fn string ->
      case Integer.parse(string) do
        {int, _rest = ""} -> [int]
        {_int, _rest} -> []
        :error -> []
      end
    end)
  end

  defp amount_odd([]), do: "There are no numbers in this list"

  defp amount_odd(list) do
    Enum.reduce(list, 0, fn item, acc ->
      case is_odd(item) do
        true -> acc + 1
        _ -> acc
      end
    end)
  end
end
