# 'gem install sinatra' and then
require 'sinatra'
require 'pry'

# binding.pry
# This defines a route
get '/' do
  'Hello world!'
end

# This handels /goodbye
get '/goodbye' do
  'Goodbye world!'
end

# looks like
# something.each do |object|
# ...
# end
# get is a method that sinatra defines
get('/method') { 'This is just Ruby' }

get '/hasthelargehadroncolliderdestroyedtheworldyet' do
  okay = "Nope."
  @var ||= 0
  @var += 1 # this would not work because @var gets reset after every request so we need database
  # @var += :test
  # erb :nope, :locals => { :status => okay }
  haml :nope2, :locals => { :status => okay }
end

get '/times' do
  # params is a function from Sinatra
  #   it returns a hash of values set using
  #   ?key=value&key2=value2 from the web
  @max = params[:max].to_i # defaults to 0
  @min = params[:min].to_i
  haml :table
end

get '/echo' do # needs a get to access the page
  @text = params[:text]
  haml :echo
end

post '/echo' do
  @text = "you posted #{params[:text]}"
  haml :echo
end

get '/new' do
  contents = params[:contents]
  File.open(params[:name], 'w') do |f|
    f.puts contents
  end
end

# Unsafe GET request
# Unsafe altogether
get '/delete' do
  # BAD!
  # exec "rm #{params[:name]}"
  "Deleted #{params[:name]}"
end

# Things that change state (create, modify, delete)
# should NEVER be GET requests
# -following a link is a GET request.
# - submitting a form can be GET or POST
#   - for user to change state, the'll have to submit a form

get '/search' do
  haml :search
end

post '/search' do
  words = File.read("words.txt").split("\n")

  @letters = params[:q].downcase.split("")

  @matches = []
  words.each do |word|
    next if word.length > 8
    if @letters.all? { |c| word.include?(c) }
      @matches << word
    end
  end

  haml :search
end


get '/user/:user_id/profile/:profile_id/group' do
  # Key in the params is defined by the
  # name (after :) in route
  "Params are: #{params}"
end
