#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>.
# All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_displayarticles.pl
#

sub pworg_api_displayarticles()
{
    # Each article is found in the content directory.  Files are stored in ASCII
    # format with a txt extension.

    ($HOMEDIR,$SRCDIR,$BLOGDIR,$nope,$year) = @_;

    @contentfiles = `${LS} -1 ${BLOGDIR}*txt`;
    @contentfiles = reverse(@contentfiles);
    $i += 0;

    if(!$year) {
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
	$year += 1900;
    }

    $newyear = 0;

    foreach $file (@contentfiles) {
        $newyear++;
	$file = `${BASENAME} $file`;
	$articleID = $file;

   	if ($articleID =~ m/txt/) {
            $articleID =~ s/.txt//;
            ($sec,$min,$hour,$mday,$mon,$y,$wday,$yday,$isdst) = 
              localtime($articleID);
            $y += 1900;
            $archive[$i] = $y;
            $i++;

	    if ($year) {
		if ($year !~ m/$y/) {
		    next;
		}
	    }
    	}

        pworg_api_displayarticle($HOMEDIR,$SRCDIR,$BLOGDIR,$file);
        $content = "";
    }

    %seen = ();
    @archive = grep { ! $seen{ $_ }++ } @archive;

    print "\t\t\t\t<div class=\"newsarchive\">\n\t\t\t\t\t<h1>Blog Archive by Year</h1>\n";

    foreach $yid (@archive) {
        print "\t\t\t\t\t<a href=\"${URL}?page=home\&amp\;year=${yid}\">${yid}</a>\n";
    }

    print (STDOUT <<HTML);
                </div>
HTML

}

1;
