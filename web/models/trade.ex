defmodule Area91.Trade do
  use Area91.Web, :model
  import Ecto.Query

  @primary_key {:trade_id, :integer, []}
  @derive {Phoenix.Param, key: :trade_id}
  schema "t_trade" do
    field :trade_calculated_id, :integer
    field :product_id, :integer
    field :pool_id, :integer
    field :trade_cost_id, :integer
    field :drawdown_id, :integer
    field :date_buy, Timex.Ecto.DateTime
    field :year_buy, :integer
    field :month_buy, :integer
    field :day_buy, :integer
    field :date_sell, Timex.Ecto.DateTime
    field :year_sell, :integer
    field :month_sell, :integer
    field :day_sell, :integer
    field :is_deleted, :boolean
    field :date_created, Timex.Ecto.DateTime
    field :date_modified, Timex.Ecto.DateTime
  end

  @doc """
  Creates a changeset based on the `a_model` and `a_params`.

  If no a_params are provided, an invalid changeset is returned
  with no validation performed.
  """
  # Note: add required params below.
  def changeset(a_model, a_params \\ %{}) do
    a_model
    |> cast(a_params, [:trade_calculated_id, :product_id, :pool_id, :trade_cost_id, :drawdown_id, :date_buy, :year_buy, :month_buy, :day_buy, :date_sell, :year_sell, :month_sell, :day_sell])
    |> validate_required([:trade_calculated_id, :product_id, :pool_id, :trade_cost_id, :drawdown_id, :date_buy, :year_buy, :month_buy, :day_buy, :date_sell, :year_sell, :month_sell, :day_sell])
  end

end