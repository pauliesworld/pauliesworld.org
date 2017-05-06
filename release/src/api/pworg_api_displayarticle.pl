#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_api_displayarticle.pl
# 

sub pworg_api_displayarticle()
{
    # Each article is found in the content directory.  Files are stored in ASCII
    # format with a txt extension.
    
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID) = @_;

    $articlepath = `$BASENAME ${articleID}`;
    $contentptr=pworg_api_openfile("${BLOGDIR}${articlepath}");

    if ($contentptr == -1) {
    	print "<meta http-equiv=\"refresh\" content=\"0; url=${URL}\">";
    }

    @content = @$contentptr;
    $thisdate = pworg_api_getdate($articlepath);
    $author = pworg_api_getarticleauthor(\@content);
    $title = pworg_api_getarticleheading(\@content);
    $content = pworg_api_getarticlecontent(\@content);

    $articleID =~ s/.txt//;

    print (STDOUT <<HTML);
            	<div class="newsheading">
               	    <div class="newstitle">
                        <a href="${BLOGURL}?id=${articleID}">$title</a>
                    </div>
                </div>
            	<div class="newscontent">
                    <br> $content <br><br>
                    <div class="newsauthor">
                        posted by $author
                    </div>
                    <div class="newsdate">
		        $thisdate
                    </div>
                </div>
HTML

}

1;
