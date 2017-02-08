defmodule Area91.AdminAccountController do
  use Phoenix.Controller

  alias Area91.Router
  alias Area91.Account
  import Area91.Router.Helpers

  plug :action

  def index(conn, _params) do
    conn
    |> assign(:accounts, Area91.Repo.all(Account))
    |> render("index.html")
  end

  def show(conn, %{"id" => a_account_id}) do
    {l_account_id, _} = Integer.parse(a_account_id)
    l_account = Area91.Repo.get!(Account, l_account_id)
    render(conn, "show.html", account: l_account)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"txt_account" => %{"name" => name, "description" => description}}) do
    l_account = %Account{name: name, description: description}
    Area91.Repo.insert(l_account)
    redirect(conn, to: admin_account_path(conn, :index))
  end

  def edit(conn, %{"id" => account_id}) do
    {account_id, _} = Integer.parse(account_id)
    conn
    |> assign(:account, Area91.Repo.get(Account, account_id))
    |> render("edit.html")
  end

  def update(conn, %{"id" => a_account_id, "account" => a_params}) do
    {l_account_id, _} = Integer.parse(a_account_id)
    l_account = Area91.Repo.get!(Account, l_account_id)
    l_account_changeset = Account.changeset{l_account, a_params}
    case Area91.Repo.update(l_account_changeset) do
      {:ok, l_account} ->
        conn
          |> put_flash(:info, "Account updated successfully.")
          |> redirect(to: admin_account_path(conn, :show, l_account))
      {:error, l_account_changeset} ->
        conn
          |> put_flash(:info, "Failed to update account.")
          |> render("edit.html", account: l_account, changeset: l_account_changeset)
    end
  end

  def delete(conn, %{"id" => account_id}) do
    {account_id, _} = Integer.parse(account_id)
    l_account = Area91.Repo.get(Account, account_id)
    Area91.Repo.delete(l_account)
    redirect(conn, to: admin_account_path(conn, :index))
  end
end
