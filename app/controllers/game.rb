post '/game' do
  @player1 = Player.find_or_create_by(name: params[:player1_name])
  @player2 = Player.find_or_create_by(name: params[:player2_name])

  session[:player1_id] = @player1.id
  session[:player2_id] = @player2.id

  @game = Game.create
  session[:game_id] = @game.id

  @round_number = @game.rounds.length + 1

  erb :game
end

post '/round_end' do
  @player1 = Player.find_by(id: session[:player1_id])
  @player2 = Player.find_by(id: session[:player2_id])
  @game = Game.find_by(id: session[:game_id])



  @round_number = @game.rounds.length + 1
  @win_time = params[:win_time]

  if params[:winner] == "player1"
    @game.rounds.create(winner_id: @player1.id, loser_id: @player2.id, win_time: @win_time)
    @winner = @player1.name
  elsif params[:winner] == "player2"
    @game.rounds.create(winner_id: @player2.id, loser_id: @player1.id, win_time: @win_time)
    @winner = @player2.name
  end



  # byebug

  erb :round_end, :layout => false
end


get '/round_next' do
  @player1 = Player.find_or_create_by(id: session[:player1_id])
  @player2 = Player.find_or_create_by(id: session[:player2_id])

  @game = Game.find_by(id: session[:game_id])
  @round_number = @game.rounds.length + 1

  erb :game
end