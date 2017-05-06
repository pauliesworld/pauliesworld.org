#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_getarticleauthor.pl
#

sub pworg_api_getarticleauthor()
{
    ($entry) = @_;
    @content = @$entry;

    foreach $line (@content) {
        if ($line =~ m/Author:/) {
            $author = $line;
            $author =~ s/Author:\ //;
            chomp($author);
            return $author;
        }
    }
}

1;
