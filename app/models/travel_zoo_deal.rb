require 'rubygems'
require 'mechanize'
require 'hpricot'

class TravelZooDeal < ActiveRecord::Base
  AGENT = Mechanize.new

  def self.scrape_site
    TravelZooCity.all.map(&:name).each{ |city| scrape_city city }
  end

  private
  def self.scrape_city city
    page = AGENT.get("http://www.travelzoo.com/local-deals/#{city}/deals")
    @response = page.content
    doc = Hpricot(@response)
    deals = doc.search("//div[@class ='dealItem']")

    deals.each_with_index { |deal, index| scrape_deal(deal, index) }
  end

  def self.scrape_deal deal, index
    deal_params = {}
    deal_params[:url] = deal.search("//h2/a").first.attributes['href']
    deal_params[:expired] = !deal.search("//div[@class='thumbWrapper']/label[@class='soldOutLabel']").empty?
    deal_params[:quantity_sold] = deal.search("//span[@id='ctl00_Main_ListViewRecentDeals_ctrl#{index}_VoucherCountSpan']").inner_html

    deal_details = deal.search("//ul[@id='ctl00_Main_ListViewRecentDeals_ctrl#{index}_ULDiscountDetails']")

    offer_price = deal_details.search("//span[@class='ourprice']'").inner_html
    discount_amount = deal_details.search("span[@class='saveprice']'").inner_html

    offer_price.slice!(0)
    discount_amount.slice!(0)

    deal_params[:offer_price] = offer_price
    deal_params[:full_price] = discount_amount.to_i + offer_price.to_i

    page = AGENT.get(deal_params[:url])
    @response = page.content
    doc = Hpricot(@response)

    expired_tag = doc.search("//span[@id='ctl00_Main_LabelCapReached']").first ||
                  doc.search("//span[@id='ctl00_Main_ExpiredText']").first
    deal_params[:limit_reached] = !doc.search("//span[@id='ctl00_Main_LabelCapReached']").empty?
    deal_params[:expiration_date] =
        expired_tag.inner_html.gsub(/\./,'').split(" ")[-2, 2].join(" ") if expired_tag
    deal_params[:effective_date] = Date.current

    TravelZooDeal.create(deal_params)
  end

end
