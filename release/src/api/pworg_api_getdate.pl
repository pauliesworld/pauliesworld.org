#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_getdate.pl
#

sub pworg_api_getdate()
{
    ($file,$cdate) = @_;
    @abbr = qw( January February March April May June July August September
                        October November December );
    $filename = $file;

    if ($cdate) {
        $filename =~ s/.*com.//;
    } else {
        $filename =~ s/\..*//;
    }

    ($sec,$min,$hour,$mday,$mon,$y,$wday,$yday,$isdst)=localtime($filename);
    $y += 1900;

    if ($min !~ m/\d\d/) {
        $min = "0${min}";
    }

    $thisdate = "${hour}:${min} PST - $abbr[$mon] $mday, $y";
    return $thisdate;
}

1;
