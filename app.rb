
require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class ChitterManager < Sinatra::Base

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
    Peep.create(text: params[:new_peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
