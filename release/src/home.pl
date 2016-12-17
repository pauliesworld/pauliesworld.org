#!/usr/bin/perl

sub homePage()
{
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$searchswitch,$year)=@_;

    print (STDOUT <<HTML);

HTML

    # We are not searching if empty $searchswitch, so let's display article
    # content

    if (!$searchswitch) {
	displayArticles($HOMEDIR,$SRCDIR,$BLOGDIR,0,$year);
    }
    else {
	searchArticles($HOMEDIR,$SRCDIR,$BLOGDIR,$query);
    }
}

1;
