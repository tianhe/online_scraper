task :cron => :environment do
  if Rails.env.production? && !ENV['STAGING']
    begin
      TravelZooDeal.scrape_site
    rescue => exception
    end
  end
end