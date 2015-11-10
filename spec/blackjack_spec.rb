require "pry"
require_relative '../blackjack'

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      expect(deck.cards.sort).to_not eq deck.cards

      # it is good not to rely on negative tests alone
      # so we assert that after sorting the deck it looks like we expect
      expect(deck.cards.sort[0..1]).to eq ["10♠", "10♣"]
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end

# These will be useful for making different hands
# '♦', '♣', '♠', '♥'

describe Hand do

  describe "#calculate_hand" do
    it "passes" do
      expect(Hand.new(["10♦", "J♥"]).calculate_hand).to eq(20)
      expect(Hand.new(["10♦", "A♠"]).calculate_hand).to eq(21)
      expect(Hand.new(["4♥", "A♠"]).calculate_hand).to eq(15)
      expect(Hand.new(["8♥", "K♠"]).calculate_hand).to eq(18)
      expect(Hand.new(["8♥", "A♦", "K♠", "A♣"]).calculate_hand).to eq(20)
    end
  end
end
