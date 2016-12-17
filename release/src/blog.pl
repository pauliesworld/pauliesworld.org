#!/usr/bin/perl

sub
blogPage()
{
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID)=@_;

    print (STDOUT <<HTML);
HTML

    # We are not searching if empty $searchswitch, so let's display article
    # content

    if ($articleID) {
    	displayArticle($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID);
    } else {
	print "<meta http-equiv=\"refresh\" content=\"0; url=${URL}\">";
    }
}

sub
displayArticle()
{
    # Each article is found in the content directory.  Files are stored in ASCII
    # format with a txt extension.
    
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID) = @_;

    $sessionid = `${DATE} +%s`;
    $sessionid+=0;
    $sessionid=${sessionid}*5.8;
    $file = `basename ${articleID}.txt`;
    $contentptr=openFile("${BLOGDIR}$file");

    if ($contentptr == -1) {
	print "<meta http-equiv=\"refresh\" content=\"0; url=${URL}\">";
    }

    @content=@$contentptr;
    $thisdate=getDate($file);
    $author=getArticleAuthor(\@content);
    $title=getArticleHeading(\@content);
    $content=getArticleContent(\@content);

    print (STDOUT <<HTML);
            	<div class="newsheading">
               	    <div class="newstitle">
                        $title
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
