#!/usr/bin/env perl

# This script merges dates from ránking and from user inscriptions

use strict;
use warnings;

use JSON;
use File::Slurp::Tiny qw(read_lines);

use v5.14;
my $ranking_data = shift || "../data/aggregated-top-Spain-evol.csv";

my @lines = read_lines( $ranking_data);

die "Problems with file $ranking_data" if ! @lines;

my @mon = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
my $i = 1;
my %months;
map $months{$_} = $i++ , @mon;
my %users;
for my $l (@lines[1..$#lines]) {
  my ($users,$monyr) = ($l =~ /^(\d+);.+;(\d{4}-\d{2})/);
  $users{$monyr}=$users;
}

my @mons = sort { $a cmp $b } keys %users;


my $date_followers = "../data/date-followers-contrib.csv";

@lines = read_lines( $date_followers);
my %new_users;
for my $l (@lines[1..$#lines]) {
  my ($yr,$mon) = split(/,\s+/,$l);
  $mon = sprintf("%02d",$mon);
  $new_users{"$yr-$mon"}++;
}

say "Month,IncUsers,NewUsers";
for (my $m = 1; $m <= $#mons; $m++ ) {
    my $these_new_users = $new_users{$mons[$m]} || 0;
    say "$mons[$m], "
	,$users{$mons[$m]}-$users{$mons[$m-1]}, ", $these_new_users";
  
}
