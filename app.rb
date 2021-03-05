require 'sinatra/base'
require './lib/peep'
require './lib/comments'
require './database_connection_setup'
require 'sinatra/flash'

class ChitterManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Hello world'
  end

  get '/peeps' do
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

  run! if app_file == $0
end
