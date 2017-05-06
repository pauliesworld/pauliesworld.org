#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>.
# All rights reserved.
#
# pauliesworld.org source
# File: pworg_page_blog.pl
# 

sub pworg_page_blog()
{
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID) = @_;

    # We are not searching if empty $searchswitch, so let's display article
    # content

    if ($articleID) {
        pworg_api_displayarticle($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID);
    } else {
        print "<meta http-equiv=\"refresh\" content=\"0; url=${URL}\">";
    }
}

1;
