class WrongNumberOfPlayersError < StandardError;
end
class NoSuchStrategyError < StandardError;
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  raise NoSuchStrategyError if !((game.fetch(0).fetch(1).downcase.eql?("r") ||
      game.fetch(0).fetch(1).downcase.eql?("p") ||
      game.fetch(0).fetch(1).downcase.eql?("s")) &&
      (game.fetch(1).fetch(1).downcase.eql?("r") ||
          game.fetch(1).fetch(1).downcase.eql?("p") ||
          game.fetch(1).fetch(1).downcase.eql?("s")))

  game.reverse!

  p1 = game.pop
  p2 = game.pop

  p1_choice = p1.fetch(1)
  p2_choice = p2.fetch(1)

  if p1_choice.downcase.eql?(p2_choice.downcase)
    return p1
  elsif p1_choice.downcase.eql?("s") && p2_choice.downcase.eql?("p")
    return p1
  elsif p1_choice.downcase.eql?("p") && p2_choice.downcase.eql?("r")
    return p1
  elsif p1_choice.downcase.eql?("r") && p2_choice.downcase.eql?("s")
    return p1
  elsif p1_choice.downcase.eql?("p") && p2_choice.downcase.eql?("s")
    return p2
  elsif p1_choice.downcase.eql?("r") && p2_choice.downcase.eql?("p")
    return p2
  elsif p1_choice.downcase.eql?("s") && p2_choice.downcase.eql?("r")
    return p2
  end
end

def rps_tournament_winner(games)


    games.flatten!(2)


  p "gamesflatten"
  p games

  games.reverse!

  #p games.count

  p1= nil
  p2 = nil
  winner = nil
  temp_arr = Array.new
  begin

    temp_arr = Array.new
    count = games.count/2
    rounds = 0
    p1 = games.pop
    p2 = games.pop

    #p "p1"
    #p p1
    #p "p2"
    #p p2
    begin

      p1_choice = p1.fetch(1)
      p2_choice = p2.fetch(1)

      if p1_choice.downcase.eql?(p2_choice.downcase)
        winner = p1
      elsif p1_choice.downcase.eql?("s") && p2_choice.downcase.eql?("p")
        winner = p1
      elsif p1_choice.downcase.eql?("p") && p2_choice.downcase.eql?("r")
        winner = p1
      elsif p1_choice.downcase.eql?("r") && p2_choice.downcase.eql?("s")
        winner = p1
      elsif p1_choice.downcase.eql?("p") && p2_choice.downcase.eql?("s")
        winner = p2
      elsif p1_choice.downcase.eql?("r") && p2_choice.downcase.eql?("p")
        winner = p2
      elsif p1_choice.downcase.eql?("s") && p2_choice.downcase.eql?("r")
        winner = p2
      end

      temp_arr.push(winner)
      rounds = rounds+1

      #p "rounds"
      #p rounds
      #p "count"
      #p count

      p1 = games.pop
      p2 = games.pop

    end while !(rounds >= count)

    games = temp_arr

    #p "gamescount"
    #p games.count
  end while (games.count != 1)
  return games.flatten!(1)
end

#rps_tournament_winner(
#[
#    [
#        [ ["Armando", "P"], ["Dave", "S"] ],
#        [ ["Richard", "R"], ["Michael", "S"] ],
#    ],
#    [
#        [ ["Allen", "S"], ["Omer", "P"] ],
#        [ ["David E.", "R"], ["Richard X.", "P"] ]
#    ]
#]
#)




#rps_game_winner([["Armando", "P"], ["Dave", "S"]])
#rps_game_winner([["Armando", "Ö"], ["Dave", "S"]])
#rps_game_winner([["Allen", "P"], ["Richard", "P"]])

