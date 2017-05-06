#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_openfile.pl
#

sub pworg_api_openfile()
{
    ($entry) = @_;

    open(IN,"<${entry}") || print "<meta http-equiv=\"refresh\" content=\"0; url=${URL}\">";
    @content=<IN>;
    close(IN);

    return(\@content);
}

1;
