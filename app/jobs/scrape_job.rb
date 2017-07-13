class ScrapeJob
  DOMAIN = 'https://www.rochdale.nl/nc'
  BASE_PATH = '/ik-zoek/vrije-sector-huurwoningen/nutehuur/lijst/670/pagina/1/gesorteerd/nieuwste-aanbod/oplopend/gezocht/1/'

  def perform
    houses.map &:save
  end

  def houses
    response = HTTParty.get(DOMAIN + BASE_PATH)
    Nokogiri::HTML(response.body).css('.list-item').map(&method(:parse_house))
  end

  def parse_house(element)
    House.new(
      name: element.css('.list-item-header > a').text,
      link: element.css('.list-item-header > a').attribute('href').value,
      address: element.css('.postalcode-city').text.strip
    )
  end
end
