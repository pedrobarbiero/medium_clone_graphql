defmodule MediumCloneWeb.Router do
  use MediumCloneWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/api", MediumCloneWeb do
  scope "/api" do
    pipe_through :api


    forward("/graphql", Absinthe.Plug, schema: MediumCloneWeb.Schema)      

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: MediumCloneWeb.Schema)      
    end

  end
end
