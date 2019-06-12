unit class Deckie;

=begin pod

=head1 NAME

Deckie - Stateful deck of cards

=head1 SYNOPSIS

=for code
use Deckie;
my Deckie $dk .= new;
say $deckie.draw; # returns a card in a Slip
say $deckie.draw: 3 # Returns 3 cards in a Slip

=head1 DESCRIPTION

A simple deck of cards, with a method that draws cards, two by default.

=head1 METHODS

=head2 new( :$cards )

With no arguments, it will generate a 40 card deck with the 4 french suites; every "card" is a simple string. You can create your own deck, as long as it's an Array.
                                                                             
=end pod


use X::Cards::NoMore;

has @.cards = 1..10 X~ <♠ ♦ ♣ ♥>;

method !_shuffle {
    @!cards = @!cards.pick: *;
}

submethod TWEAK {
    self!_shuffle; 
}

#| Draw a Slip of cards; throws X::Cards::NoMore if the deck is empty, X::OutOfRange if more cards than available are requested.
method draw ( UInt $how-many = 1 --> Slip ) {
    if ( ! @!cards.elems ) {
	X::Cards::NoMore.new.throw
    }
    if ( $how-many > @!cards.elems ) {
	X::OutOfRange.new( got => $how-many,
			   range => "1.." ~ @!cards.elems).throw
    }
    if @!cards {
        self!_shuffle;
        my @draw = gather {
            for ^$how-many {
                take @!cards.pop
            }
        }
        return @draw.Slip;
    }
}
