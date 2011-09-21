class PopulateCities < ActiveRecord::Migration
  def up
    cities= %w(
            Albany
            Albuquerque
            Atlanta
            Austin
            Baltimore
            Boston
            Buffalo
            California-Central-Coast
            Charlotte
            Chicago
            Cincinnati
            Columbus
            Dallas
            Denver
            Des-Moines
            Detroit
            Fort-Lauderdale
            Fort-Myers-Naples
            Greensboro
            Hampton-Roads
            Hartford-New-Haven
            Hawaii
            Houston
            Indianapolis
            International
            Kansas-City
            Las-Vegas
            Beach-Cities
            Hollywood
            Los-Angeles
            San-Fernando-Valley
            Miami
            Milwaukee
            Minneapolis
            Nashville
            New-Orleans
            New-York-City
            Orange-County
            Orlando
            Palm-Springs
            Philadelphia
            Phoenix
            Pittsburgh
            Portland
            Richmond
            Sacramento
            Salt-Lake-City
            San-Antonio
            San-Diego
            East-Bay
            Napa
            San-Francisco
            South-Bay
            Seattle-Tacoma
            St-Louis
            Tampa-St-Petersburg
            Tucson
            Washington-DC
            West-Palm-Beach )
    cities.each{ |c| TravelZooCity.create(:name => c) }
  end

  def down
    TravelZooCity.destroy_all
  end
end
