require 'sinatra'
enable :sessions

get '/' do
  session["comp_num"] = rand(100)
  session["my_try"] = 1
  @max_try = 5

  haml :example
end

post '/' do
  @com = session["comp_num"]
  @try = session["my_try"]
  @input = params[:text].to_i
  @higher = false
  @lower = false
  @gameover = false
  @won = false
  @lose = false
  @max_try = 5

  session["my_try"] += 1
  if(@input < @com)
    @higher = true
    @lose = true if @try >= @max_try
  elsif(@input > @com)
    @lower = true
    @lose = true if @try >= @max_try
  else
    @won = true if @try <= @max_try
  end


  haml :example
end
