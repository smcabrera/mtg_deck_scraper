url =  "http://modernnexus.com/introduction-to-8rack/"

require 'mechanize'

class StarCityScraper
  def initialize(url, output_file = nil)
    @url = url
    @output_file = output_file
  end

  def scrape
    agent = Mechanize.new
    page = agent.get(@url)
    cards = page.css('ul > li').select { |element| card?(element) }
    deck = cards.map{ |card| card.text }
    deck = split_sideboard(deck)
    if @output_file
      output_to_text(@output_file, deck)
    end
    puts deck
  end

  def card?(element)
    child_attributes = element.children.last.attributes.first
    if child_attributes && child_attributes.count > 1
      url = child_attributes[1]
    end

    if url
      url.value.include?("singlesearch")
    else
      false
    end
  end

  def process_card(card_string)
    number = card_string[0,1].to_i
    name = card_string.gsub(number.to_s, "").strip
    { name: name, number: number }
  end


  def split_sideboard(card_list)
    card_list.map! { |card| process_card(card) }
    deck = []
    sum = 0
    sideboard = false
    card_list.each do |card|
      sum += card[:number]
      deck << "#{card[:number]} #{card[:name]}"
      if sum == 60
        deck << ""
      end
    end
    deck
  end

  def output_to_text(filename, cards)
    card_list = cards.join("\n")
    File.write(filename, card_list)
  end
end

#url = "http://sales.starcitygames.com//deckdatabase/displaydeck.php?DeckID=98735"
#textfile = 'new-deck.txt'
puts 'Enter a URL: '
url = gets.chomp
puts 'Enter a filepath: '
ouput = gets.chomp
output = ouput == "" ? nil : output
StarCityScraper.new(url, ouput).scrape
