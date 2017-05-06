#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_page_home.pl
# 

sub pworg_page_home()
{
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$searchswitch,$year)=@_;

    # We are not searching if empty $searchswitch, so let's display article
    # content

    if (!$searchswitch) {
        pworg_api_displayarticles($HOMEDIR,$SRCDIR,$BLOGDIR,0,$year);
    } else {
        pworg_api_searcharticles($HOMEDIR,$SRCDIR,$BLOGDIR,$query);
    }
}

1;
