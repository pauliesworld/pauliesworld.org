#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>.
# All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_searcharticles.pl
#

sub pworg_api_searcharticles()
{
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$query) = @_;

    $i += 1;
    @contentfiles = `${LS} -1 ${BLOGDIR}*txt;`;
    @contentfiles = reverse(@contentfiles);

    foreach $file (@contentfiles) {
        chomp($file);

        if (`${GREP} -i '$query' $file`) {
            push(@foundfiles,$file);
        }
    }

    print (STDOUT <<HTML);
                <div class="search">
                    <div class="searchquery">
                        You searched for <i>$query</i>
                    </div>
                    <div class="searchresults">
HTML
    foreach $file (@foundfiles) {
        $articleID = `${BASENAME} $file`;
        $articleID =~ s/.txt//g;
        $contentptr = pworg_api_openfile("$file");
        @content = @$contentptr;

        $author = pworg_api_getarticleauthor(\@content);
        $title = pworg_api_getarticleheading(\@content);
        chomp($articleID);
        print "\t\t\t[ $i ]<a href=\"${BLOGURL}?id=${articleID}\"> $title</a><br><br>\n";
        $i++;
    }

    if ($i == 1) {
        print "\t\t\tNo results found<br><br>\n";
    }
   
    print "\t\t    </div>\n\t\t</div>\n";
}

1;
