defmodule Eunice do
  @moduledoc """
  Documentation for `Eunice`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Eunice.hello()
      :world

  """
  def hello do
    :world
  end

  @ssh_password "NSK"

  def ssh_check_pass(_provided_username, provided_password) do
    provided_password == to_charlist(@ssh_password)
  end

  def ssh_show_prompt(_peer, _username, _service) do
    msg = """
    ssh #{Node.self()} # Use password "#{@ssh_password}"
    """

    {~c"Eunice", to_charlist(msg), ~c"Password: ", false}
  end
end
