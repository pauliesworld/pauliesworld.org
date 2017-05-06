#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>.
# All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_getarticlecontent.pl
#

sub pworg_api_getarticlecontent()
{
    ($entry) = @_;
    @content = @$entry;

    foreach $line (@content) {
        if (($line !~ m/Author:/) && ($line !~ m/Heading:/)) {
            $content .= $line;
            $content =~ s/Content://g;
        }
    }
    return $content;
}

1;
