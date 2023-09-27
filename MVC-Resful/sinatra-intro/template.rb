=begin
A toy Sinatra app to demonstrate the basic concept of MVC, RESTful Routes and CRUD.
Run ``bundle install`` to make sure you have necessary gems installed.
To run the script, type ``ruby template.rb`` in the command line.
Updated by: Jeremy Warner
Original author: Hezheng Yin
=end

# Load libraries we need
require 'sinatra'
require 'active_record'
require 'json'

# Tell active_record which database to connect to
db_options = { adapter: 'sqlite3', database: 'todos_db' }
ActiveRecord::Base.establish_connection(db_options)

# Write a migration class for creating the Todo table in the database
class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :description
    end
  end
end

# Create the Todo table by executing the migration
begin
  CreateTodos.new.change
rescue ActiveRecord::StatementInvalid
  # It's probably OK
end

# Create a Todo class by inheriting from ActiveRecord::Base
class Todo < ActiveRecord::Base
end

# Populate the database if it is empty to avoid running this code twice
if Todo.all.empty?
  Todo.create(description: "Hola esto es una prueba")
  Todo.create(description: "de una pagina web con Sinatra")
end

# Display all todos
get '/todos' do
  content_type :json
  Todo.all.to_json
end

# Show a specific todo
get '/todos/:id' do
  content_type :json
  todo = Todo.find_by_id(params[:id])
  if todo
    return { description: todo.description }.to_json
  else
    return { msg: "error: specified todo not found" }.to_json
  end
end

# Create a new todo
post '/todos' do
  content_type :json
  request_body = JSON.parse(request.body.read)
  if request_body['description'].to_s.empty?
    status 400
    return { msg: "error: description can't be blank" }.to_json
  end

  new_todo = Todo.create(description: request_body['description'])
  if new_todo.persisted?
    status 201
    return { msg: "create success" }.to_json
  else
    status 500
    return { msg: "error: failed to create todo" }.to_json
  end
end

# Update a todo
put '/todos/:id' do
  content_type :json
  todo = Todo.find_by_id(params[:id])
  if todo
    request_body = JSON.parse(request.body.read)
    if request_body['description'].to_s.empty?
      status 400
      return { msg: "error: description can't be blank" }.to_json
    end

    if todo.update(description: request_body['description'])
      return { msg: "update success" }.to_json
    else
      status 500
      return { msg: "error: failed to update todo" }.to_json
    end
  else
    status 404
    return { msg: "error: specified todo not found" }.to_json
  end
end

# Delete a todo
delete '/todos/:id' do
  content_type :json
  todo = Todo.find_by_id(params[:id])
  if todo
    if todo.destroy
      return { msg: "delete success" }.to_json
    else
      status 500
      return { msg: "error: failed to delete todo" }.to_json
    end
  else
    status 404
    return { msg: "error: specified todo not found" }.to_json
  end
end
