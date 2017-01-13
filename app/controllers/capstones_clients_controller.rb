class CapstonesClientsController < ApplicationController

 def index
  unirest_capstones = Unirest.get("/api/v1/capstones.json").body
    capstones = []
    unirest_capstones.each do |unirest_capstone|
      capstone = Capstone.new(unirest_capstone)
      capstones << capstone
    end
    return capstones
 end

 def show
  unirest_capstones = Unirest.get("/api/v1/capstones/#{id}.json").body
  
end
end
