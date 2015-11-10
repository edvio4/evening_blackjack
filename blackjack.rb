require_relative 'deck'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    score = 0
    aces = 0
    @cards.each do |card|
      if !(/[JQK]/ =~ card).nil?
        score+=10
      elsif card.to_i != 0
        score+=card.to_i
      else
        aces+=1
        score <= 10 ? score+=11 : score+=1
      end
      aces.times do { score > 21 ? score-=10 }
    end
    score
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
puts "Your score with the hand (#{cards.join(', ')}): #{hand.calculate_hand}"
