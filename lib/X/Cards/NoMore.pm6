unit class X::Cards::NoMore is Exception;

=begin pod

=head1 NAME

X::Cards::NoMore - Exception thrown when there are no more cards

=head1 SYNOPSIS

=for code
use X::Cards::NoMore;
throw X::Cards::NoMore;

=head1 DESCRIPTION

Thrown when there are no more cards in the deck.

=head1 METHODS

=end pod

#| Returns the exception message
method message() {
        "No more cards left, sorry";
}

=begin pod

=head1 AUTHOR
JJ Merelo <jjmerelo@gmail.com>

=head1 COPYRIGHT AND LICENSE
Copyright 2018,2019 JJ Merelo
This library is free software; you can redistribute it and/or modify
it under the Artistic License 2.0. 

=end pod


