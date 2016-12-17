#!/usr/bin/perl

sub
displayArticles()
{
    # Each article is found in the content directory.  Files are stored in ASCII
    # format with a txt extension.

    ($HOMEDIR,$SRCDIR,$BLOGDIR,$nope,$year)=@_;

    @contentfiles = `ls -1 ${BLOGDIR}*txt`;
    @contentfiles = reverse(@contentfiles);
    $sessionid = `${DATE} +%s`;
    $sessionid+=0;
    $sessionid=${sessionid}*5.8;
    $i+=0;

    if(!$year) {
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime();
	$year +=1900;
    }

    $newyear = 0;
    foreach $file (@contentfiles) {
        $newyear++;
	$file = `basename $file`;
	$articleID = $file;

   	if($articleID =~ m/txt/) {
	    $articleID =~ s/.txt//;
	    ($sec,$min,$hour,$mday,$mon,$y,$wday,$yday,$isdst)=localtime($articleID);
	    $y+=1900;
	    $archive[$i] = $y;
	    $i++;

	    if ($year) {
		if ($year !~ m/$y/) {
		    next;
		}
	    }
    	}
	$contentptr=openFile("${BLOGDIR}$file");
	@content=@$contentptr;

	$thisdate=getDate($file);
	$author=getArticleAuthor(\@content);
	$title=getArticleHeading(\@content);
	$content=getArticleContent(\@content);

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
        $content = "";
    }

       %seen = ();
       @archive = grep { ! $seen{ $_ }++ } @archive;

	print "\t\t<div class=\"newsarchive\">\n\t\t    <h1>Blog Archive by Year</h1>\n";
	foreach $yid (@archive) {
		print "\t\t    <a href=\"${URL}?page=home\&amp\;year=${yid}\">${yid}</a>\n";
	}

    print (STDOUT <<HTML);
		</div>
HTML

}

sub
searchArticles()
{
    ($HOMEDIR,$SRCDIR,$BLOGDIR,$query)=@_;

    $i+=1;
    @contentfiles = `ls -1 ${BLOGDIR}*txt;`;
    @contentfiles = reverse(@contentfiles);

    foreach $file (@contentfiles) {
        chomp($file);

        if (`grep -i '$query' $file`) {
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
	$articleID = `basename $file`;
	$articleID =~ s/.txt//g;
        $contentptr=openFile("$file");
        @content=@$contentptr;

        $author=getArticleAuthor(\@content);
        $title=getArticleHeading(\@content);
   	chomp($articleID);
	print "\t\t\t[ $i ]<a href=\"${BLOGURL}?id=${articleID}\"> $title</a><br><br>\n";
	$i++;
    }

    if ($i == 1) {
	print "\t\t\tNo results found<br><br>\n";
    }
    
    print "\t\t    </div>\n\t\t</div>\n";

}

sub
getDate()
{
    ($file,$cdate)=@_;
    @abbr = qw( January February March April May June July August September
                        October November December );
    $filename = $file;

    if ($cdate) {
	$filename =~ s/.*com.//;
    } else {
        $filename =~ s/\..*//;
    }

    ($sec,$min,$hour,$mday,$mon,$y,$wday,$yday,$isdst)=localtime($filename);
    $y+=1900;

    if ($min !~ m/\d\d/) {
        $min = "0${min}";
    }

    $thisdate="${hour}:${min} PST - $abbr[$mon] $mday, $y";
    return $thisdate;
}

sub
getArticleAuthor()
{
    ($entry)=@_;
    @content=@$entry;

    foreach $line (@content) {
        if ($line =~ m/Author:/) {
            $author = $line;
            $author =~ s/Author:\ //;
            chomp($author);
	    return $author;
        }
    }
}

sub
getArticleHeading()
{
    ($entry)=@_;
    @content=@$entry;

    foreach $line (@content) {
        if ($line =~ m/Heading:/) {
            $title = $line;
            $title =~ s/Heading:\ //;
            chomp($title);
	    return $title;
        }
    }
}

sub
getArticleContent()
{
    ($entry)=@_;
    @content=@$entry;

    foreach $line (@content) {
        if (($line !~ m/Author:/) && ($line !~ m/Heading:/)) {
            $content .= $line;
            $content =~ s/Content://g;
        }
    }
    return $content;
}

1;
