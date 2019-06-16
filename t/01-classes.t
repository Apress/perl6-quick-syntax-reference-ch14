#!/usr/bin/env perl6

use v6;

use Test;

use Deckie;

plan 21;
my $deck = Deckie.new;
for 1..($deck.cards.elems/2) {
    given $deck.draw( 2 ) {
	isnt( @_[0], @_[1], "Cards from pair are different");
    }
}

throws-like { $deck.draw( 2 ) }, X::Cards::NoMore, "No more cards" ;


