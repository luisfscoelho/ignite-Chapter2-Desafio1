defmodule Flightex.Users.Create do
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{id: id} = user}) do
    UserAgent.save(user)

    {:ok, id}
  end
end
