#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_getarticleheading.pl
#

sub pworg_api_getarticleheading()
{
    ($entry) = @_;
    @content = @$entry;

    foreach $line (@content) {
        if ($line =~ m/Heading:/) {
            $title = $line;
            $title =~ s/Heading:\ //;
            chomp($title);
            return $title;
        }
    }
}

1;
