# Require 
require 'pry'

# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

# Helper methods

# Creates an separate array of all players
def join_teams
  game_hash[:home][:players].concat(game_hash[:away][:players])
end

# Finds player hash with largest shoe size
def home_shoe_max
  join_teams.max_by do |player|
    player[:shoe]
end
end

# Finds player name, given hash
def find_player_name(hash)
  hash[:player_name]
end

# Returns team side, given team name
def find_team_side(team)
  hash = game_hash.select do |k,v|
    v[:team_name] == team
  end
  hash.keys[0]
end

# Implementation methods

# Returns hash of player's stats, given player's name.
# Moved this method to the beginning to use with other following methods.

def player_stats(name)
  result = join_teams.select do |player|
    player[:player_name] == name
end
  result[0]
end


# Returns points scored by player
def num_points_scored(name)
  hash = player_stats(name)
  hash[:points]
end


# Returns shoe size of the player
def shoe_size(name)
  hash = player_stats(name)
  hash[:shoe]
end


# Returns array of team's colors
def team_colors(team)
  side = find_team_side(team)
  game_hash[side][:colors]
end

# Returns array of team names
def team_names
#  array = []
  game_hash.select do |k,v|
    v = 
end
#  array << game_hash[:home][:team_name]
#  array << game_hash[:away][:team_name]
end

# Returns array of player numbers, given team name
def player_numbers(team)
  side = find_team_side(team)
  numbers = []
  counter = 0
  while game_hash[side][:players][counter] do
    numbers << game_hash[side][:players][counter][:number]
    counter += 1
end
  numbers
end

# Returns number of rebounds associated with player that has largest shoe size
def big_shoe_rebounds
# Identify player's name with largest shoe size
  big_foot = find_player_name(home_shoe_max)
# Return that player's number of rebounds
  hash = player_stats(big_foot)
  hash[:rebounds]
end
