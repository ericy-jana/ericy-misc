#!/usr/bin/env perl
use strict;
use warnings;

my $schema_file = $ARGV[0];
my $keyspace = $ARGV[1];

open my $fh, '<', $schema_file or die "Cannot open $schema_file: $!";

while (<$fh>) {
  if (/CREATE KEYSPACE $keyspace/../CREATE KEYSPACE (?!$keyspace)/) {
    next if /CREATE KEYSPACE (?!$keyspace)/;
    print ;
  }
}

close($fh);
