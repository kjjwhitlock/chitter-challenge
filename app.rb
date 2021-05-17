require 'sinatra/base'
require './lib/peep'
require './lib/comments'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'

class ChitterManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    print session[:user_id]
    @peeps = Peep.all
    erb :home
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/new' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :'comments/new'
  end

  post '/peeps/:id/comments/new' do
    Comment.create(comment: params[:comment], peep_id: params[:id])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
  user = User.create(email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/peeps'
end

delete '/peeps/:id' do
  connection = PG.connect(dbname: 'chitter')
  connection.exec("DELETE FROM comments WHERE peep_id = #{params['id']}")
  connection.exec("DELETE FROM peeps WHERE id = #{params['id']}")
  redirect '/peeps'
end

  run! if app_file == $0              
end
