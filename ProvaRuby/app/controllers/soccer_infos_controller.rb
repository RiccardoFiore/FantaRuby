class SoccerInfosController < ApplicationController
    def index
      @response = Unirest.get "https://sportsop-soccer-sports-open-data-v1.p.mashape.com/v1/leagues/serie-a/seasons/17-18/teams",
          headers:{
            "X-Mashape-Key" => "gbTXi7A4LSmsh5ViprmXBGWmESpdp1XQfzZjsn2h4H1iyTzpS3",
            "Accept" => "application/json"
          }
      teams = @response.body["data"]["teams"]
      @richieste_rimanenti = @response.headers[:x_ratelimit_requests_remaining] + "/" + @response.headers[:x_ratelimit_requests_limit]
      @team_name = []
      @team_foundation = []
      @team_website = []
      for i in (0..19)
        @team_name[i] = teams[i]["name"]
        @team_foundation[i] = teams[i]["team_foundation"]
        @team_website[i] = teams[i]["team_website"]
      end
    end

    def show
      @team = params[:id].downcase
      @response = Unirest.get "https://sportsop-soccer-sports-open-data-v1.p.mashape.com/v1/leagues/serie-a/seasons/17-18/teams/" + @team.to_s + "/players",
          headers:{
            "X-Mashape-Key" => "gbTXi7A4LSmsh5ViprmXBGWmESpdp1XQfzZjsn2h4H1iyTzpS3",
            "Accept" => "application/json"
          }
      @richieste_rimanenti = @response.headers[:x_ratelimit_requests_remaining] + "/" + @response.headers[:x_ratelimit_requests_limit]
      players = @response.body["data"]["players"]
      @player_name = []
      @player_surname = []
      @player_birthday = []
      @player_nationality = []
      @player_position = []
      @rose_size = @response.body["data"]["players"].size
      for i in (0..@rose_size-1)
        @player_name[i] = players[i]["name"]
        @player_surname[i] = players[i]["fullname"]
        @player_birthday[i] = players[i]["birthday"][0,10]
        @player_nationality[i] = players[i]["nationality"].capitalize
        @player_position[i] = players[i]["position"].capitalize
      end
    end
end
