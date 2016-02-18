require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate

  def self.states
    file = File.read(Dir.pwd + "/db/estados.json")
    json = JSON.parse file

    json.each do |f|
      State.create(:name => f["Nome"], :code => f["Sigla"]) unless State.exists?(:code => f["Sigla"])
    end
  end

  def self.cities

    file = File.read(Dir.pwd + "/db/ibge.json")
    json = JSON.parse file

    json.each do |f|
      # Verify state
      state = State.find_by_code f["fields"]["uf"]
      City.create(:name => f["fields"]["nome"],
                  :ibge_code => f["pk"],
                  :state => state) unless City.exists?(:ibge_code => f["pk"])
    end

  end

  def self.populate
    states
    cities
  end
   
end

BRPopulate.populate
