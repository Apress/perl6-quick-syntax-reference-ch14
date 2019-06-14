#!/usr/bin/env perl6

use v6;

use Deckie;

say Deckie.new.draw( (@*ARGS[0] // 2).Int ).join(" ➟ " );
