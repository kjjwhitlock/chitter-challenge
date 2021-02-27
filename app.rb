require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    redirect '/new'
  end

  get '/new' do
    erb :new_peep
  end

  run! if app_file == $0
end
#comment added
