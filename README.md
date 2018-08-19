# Newchallenge

Installing Elixir:

## Mac OS X:

  * Update your homebrew to latest: brew update
  * Run: brew install elixir

## Unix (and Unix-like):

  * Ubuntu 14.04/16.04/16.10/17.04 or Debian 7/8/9

  * Add Erlang Solutions repo: wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
  * Run: sudo apt-get update
  * Install the Erlang/OTP platform and all of its applications: sudo apt-get install esl-erlang
  * Install Elixir: sudo apt-get install elixir


## Install Hex Manager Package & Phoenix Framework

  * mix local.hex
  * mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

## PostgreSQL

The database I use in the project is PostgreSQL, so you need to install it to make it work.

OS X:

* brew install postgresql

Linux (Ubuntu):

* sudo apt-get install postgresql

Windows:

* Download in http://www.postgresqltutorial.com/install-postgresql/

# Configure PostgreSQL

Open terminal and execute the following scripts

* psql postgres

And then run the command:

* CREATE USER postgres WITH PASSWORD 'postgres';


# To start your Challenge app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can enter the URL (http://localhost:4000/institutes) from your browser.


