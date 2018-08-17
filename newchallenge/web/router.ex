defmodule Newchallenge.Router do
  use Newchallenge.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Newchallenge do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index



    resources "/institutes", InstituteController do
      post "/course" , InstituteController, :add_course
    end
    resources "/courses", CourseController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Newchallenge do
  #   pipe_through :api
  # end
end
