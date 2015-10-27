#require 'rubygems' dont think i need this for cloud 9
require 'sinatra'
require 'shotgun'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'some_random_string'

helpers do
  def calculate_total(cards)
    arr = cards.map { |element| element[1]}
    
    total = 0
    arr.each do |a|
      if a == "A"
        total +=11
      else
        total +=a.to_i == 0 ? 10 : a.to_i
      end
    end
    
    arr.select { |element| element == "A"}.count.times do
      break if total <=21
      total -=10
    end
    total
  end
  
  def card_image(card)
  suit = case card[0]
    when "H" then "hearts"
    when "D" then "diamonds"
    when "C" then "clubs"
    when "S" then "spades"
  end
    
    value = card[1]
    if ['J', 'Q', 'K', 'A'].include?(value)
      value = case card[1]
        when "J" then "jack"
        when "Q" then "queen"
        when "K" then "king"
        when "A" then "ace"
      end
    end
      
     "<img src='/images/cards/#{suit}_#{value}.jpg' class='card_image'>"
    end
    
    def winner(msg)
      @hit_or_stay_button = false
      @success = "#{session[:player_name]} wins! #{msg}"
    end
    
    def loser(msg)
      @hit_or_stay_button = false
      @error = "#{session[:player_name]} loses. #{msg}"
    end
    
    def tie(msg)
      @hit_or_stay_button = false
      @success = "#{msg} Its a tie."
    end
      
end

before do #this filter says that before any of these actions below happen keep the hit or stay buttons on the screen.
  @hit_or_stay_button = true #you're setting it to true here so that in you erb file the if statement will evaluate.
end

get '/' do
  if session[:player_name]
     redirect '/game'
  else
    redirect '/new_player'
  end
end

get '/new_player' do
  erb :new_player
end

post '/new_player' do
  if params[:player_name].empty?
    @error = "You must enter a Name"
    halt erb(:new_player)
  elsif params[:player_name].match(/d+/)
    @error = "You must enter letters only."
    halt erb(:new_player)
  end
  
  session[:player_name] = params[:player_name] # your session hash has to match whichever session you want to save the player name to and your params hash must match the code in your erb template
  redirect '/game'
end

get '/game' do
  suits = ['H', 'D', 'S', 'C']
  values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  session[:deck] = suits.product(values).shuffle!
  
  session[:dealer_cards] = []
  session[:player_cards] = []
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  
  erb :game
end

post '/game/player/hit' do
  session[:player_cards] << session[:deck].pop
  
  player_total = calculate_total(session[:player_cards])
  if player_total == 21
    winner!("session[:player_name] has a total of #{player_total}")
  elsif player_total >21
    loser!("#{session[:player_name]} busted.")
  end
  
  erb :game #we want to render the game code here NOT REDIRECT to the game route. if we put redirect '/game' it would start our game over b/c the game route creates a new game, we want this route to display the game.erb code
end

post '/game/player/stay' do
  @success = "You have chosen to stay."
  @hit_or_stay_button = false
  redirect '/game/dealer'
end

get '/game/dealer' do 
  @hit_or_stay_button = false
  
  dealer_total = calculate_total(session[:dealer_cards])
  
  if dealer_total == 21
    loser!("Dealer has Blackjack")
  elsif dealer_total > 21
    winner!("Dealer busted.")
  elsif dealer_total >=17
  redirect '/game/compare'
  else
    @show_dealer_hit_button = true
  end
  
  erb :game
end

post '/game_dealer_hit' do 
  session[:dealer_cards] << session[:deck].pop
  redirect '/game/dealer'
end

get '/game/compare' do
  @hit_or_stay_button = false
  @show_dealer_hit_button = false
  player_total = calculate_total(session[:player_cards])
  dealer_total = calculate_total(session[:dealer_cards])
  
  if player_total < dealer_total
    loser!("#{session[:player_name]} stayed at #{player_total}. Dealer stays at #{dealer_total}")
  elsif player_total > dealer_total
    winner!("#{session[:player_name]} stayed at #{player_total}. Dealer stays at #{dealer_total}")
  else
    tie!("Both players have #{player_total}")
  end
  
  erb :game
end







