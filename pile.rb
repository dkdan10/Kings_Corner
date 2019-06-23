
class Pile
    attr_accessor :top_card, :bottom_card

    def initialize(card)
        @top_card = card
        @bottom_card = card
    end


    def valid_play?(card)
        return true if @top_card == nil
        card.color != @top_card.color && card.kings_corner_value + 1 == @top_card.kings_corner_value
    end

    def play(card)
        if valid_play?(card)
            @top_card = card
            @bottom_card = card if @bottom_card == nil
        else
            raise "Not valid play"
        end
    end

    def add_to(pile)
        if pile.valid_play?(@bottom_card)
            pile.top_card = @top_card
            @top_card = nil
            @bottom_card = nil
        else
            raise "Not valid play"
        end
    end

end


class KingPile < Pile
    def initialize(card = nil)
        if !card.nil?
            raise "Can't create king pile if card isn't king" if card.value != :king
        end
        @top_card = card #defaults to nil
        @bottom_card = card #defaults to nil
    end

    def add_to(pile)
        raise "CANNOT MOVE KING PILE"
    end

    def valid_play?(card)
        if @top_card.nil?
            return true if card.value == :king
            return false
        end 
        card.color != @top_card.color && card.kings_corner_value + 1 == @top_card.kings_corner_value
    end

end