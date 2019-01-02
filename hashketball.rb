require 'pry'

# Write your code here!

def game_hash 
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players: { 
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2  
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10 
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12 
        }
      }
    }
  }
end

# So, we have a hash with our data. The top-level keys are :home and :away - we want to be able to find data for both teams by simply passing an argument of a player's name into the method. First, the :home and :away teams have to be accessible. To do that, they can be merged into a method with .merge, which will accept the keys of :players and its values for both the :home and :away teams. The method can be used to access player data. Next we go into this merged hash and .fetch the player's name, to get :points, :shoe, and stats. A similar strategy could be used to get both team's values into one method, which could be used for team_names, player_numbers, 

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def teams
  game_hash.values 
end
 
def num_points_scored (player_name)
  players.fetch(player_name).fetch(:points)
end 

def shoe_size (player_name)
  players.fetch(player_name).fetch(:shoe)
end

def player_stats(player_name)
  players.fetch(player_name)
end

def team_colors (team_name)
# takes in an argument of the team name and returns an array of that teams colors
  
  if team_name == "Brooklyn Nets"
    game_hash[:home][:colors]
  elsif team_name == "Charlotte Hornets"
    game_hash[:away][:colors]
  else
    "Wrong game!"
  end 
end 

def team_names
# operates on the game hash to return an array of the team names
 
  teams.collect { | team | team.fetch(:team_name) }
end

def team_stat_look_up (team_name)
  teams.find { | team | team.fetch(:team_name) == team_name }
end

def player_numbers (team_name)
# returns an array of the jersey number's for that team
  
  team_stat_look_up(team_name)[:players].collect { | player, stat | stat.fetch(:number) }
end 

def big_shoe_rebounds 
# first determine which player has the biggest shoe size and fetch that stat. then fetch his :rebound.  
 
  big_shoes = players.max_by { | player, stat | stat.fetch(:shoe)}
  big_shoes[1].fetch(:rebounds)
end


# BONUS:

=begin 
def most_points_scored
  high_scorer = players.max_by { | player, points | points.fetch(:points) }
  high_scorer[0] 
end 

def winning_team
# 
end 

def player_with_longest_name
  longest_name = players.max_by { | player, name | player.fetch(:players) }
  longest_name[0]
end 
=end   

=begin 

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

good_practices

=end 
