class CapstonesClientsController < ApplicationController

 def index
  unirest_capstones = Unirest.get("", headers: {"Authorization" => "#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_USER_EMAIL']}"}).body
    capstones = []
    unirest_capstones.each do |unirest_capstone|
      capstone = Capstone.new(unirest_capstone)
      capstones << capstone
    end
    return capstones
 end

 def show
    @capstone = Capstone.find_by(id: params[:id])
end
