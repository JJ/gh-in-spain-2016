#!/usr/bin/env perl

use strict;
use warnings;

use JSON;
use File::Slurp::Tiny qw(read_file);

use v5.14;
my $filename = shift || "../data/user-data-España.json";

my $data_text = read_file( $filename);

die "Problems with file $filename" if ! $data_text;

my $data = from_json $data_text;
my @mon = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
my $i = 1;
my %months;
map $months{$_} = $i++ , @mon;
say "Yr,Mon,Contribs,Followers";
for my $d (@$data) {
  my ($mon, $yr) = ($d->{'join_date'} =~ /(\w+)\s+\d+,\s+(\d+)/);
  say "$yr, $months{$mon}, ", $d->{'contributions'} || 0, ", ", $d->{'followers'} || 0;
}

