#!/usr/local/bin/perl

sub
pwFramework() 
{
    ($page,$query,$HOMEDIR,$SRCDIR,$BLOGDIR,$blog,$year)=@_;
    
    $date = `${DATE} +'%B %e, %Y'`;
    chomp($date);
    $description="PauliesWorld.org is the personal website of Paul Johnson";
    
    if (!$page) {
        $page = "Paulie's World";
	$articleID = param('id');

	if($blog && $articleID) {
	    $page = $articleID;
	    $header = `grep 'Heading:' ${BLOGDIR}${articleID}.txt`;
	    $header =~ s/Heading: //;
	    $page = $header;
	}

	$title = $page;

    } else {
    
    	$title = $page;

    	if ($title !~ m/Paulie/) {
            $title =~ s/\b(\w)/\U$1/g;
    	}

    	if ($title =~ m/Resume/) {
            $title="Paul Johnson's Resume";
        }
    
    	if ($title =~ m/About/) {
            $title="About Paul";
        }

     	if ($title =~ m/Search/) {
            $title="Searching for \"$query\"...";
        }

        if ($title =~ m/Home/) {
            $title="Paulie's World";
        }

        if ($title =~ m/Travels/) {
            $title="Paul's Travels";
	    
	    if (param('location')) {
                $location = param('location');
		chomp($location);
                $title = `grep 'Title:' ${TRAVDIR}${location}.txt`;
                $title =~ s/Title: //;
		chomp($title);
	    }
        }

	if ($title =~ m/Source/) {
            $param_project = param('project');
            $projectptr=openFile("${PRJTDIR}${param_project}.txt");
            @projectinfo = @$projectptr;

            @title = grep(/Title:/,@projectinfo);
            $title = "@title";
            $title =~ s/Title:\ //;
            chomp($title);
	}

        if (!$query) {
            $query = "search";
        }
    }

    print "Content-type: text/html\r\n\r\n";
    print(STDOUT <<HTML);
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title> $title </title>
        <link rel="stylesheet" type="text/css" href="${URL}css/framework.css">
        <link rel="stylesheet" type="text/css" href="${URL}css/news.css">
HTML
        if ($title =~ m/Search/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/search.css\">\n";
        }

        if ($title =~ m/About/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/about.css\">\n";
        }

        if ($title =~ m/Project/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/project.css\">\n";
        }

        if ($page =~ m/travels/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/travels.css\">\n";
        }

        if ($page =~ m/source/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/source.css\">\n";
        }

        if ($title =~ m/404/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/error.css\">\n";
        } 

print(STDOUT <<HTML);
        <link rel="shortcut icon" href="${URL}img/icon.ico">
        <meta name="keywords" content="pauliesworld paulie paulies world paul johnson broomfield colorado perl c java cpp solaris oracle sun unavco cu zfs storage dtrace zfssa">
        <meta name="description" content="$description">
        <meta name="published_date" content="09/09/16 13:32:04 MST">
        <meta name="date" content="09/09/16 13:32:04 MST">
        <meta name="generator" content="PauliesWorld.org" >
        <meta name="author" content="Paul Johnson" >
        <meta name="venue" content="www.pauliesworld.org" >
        <meta name="locale" content="en-US" >
        <meta name="robots" content="index,follow" >
        <meta http-equiv="content-language" content="en-US" >
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    </head>
    <body>
        <div id="container">
            <div id="header">
                <ul>
                    <li><a href="${URL}?page=projects">projects</a></li>
                    <li><a href="${URL}?page=travels">travels</a></li>
                    <li><a href="${URL}?page=home"><img src="${URL}img/logo.png" alt="Paul Johnson"></a></li>
                    <li><a href="${URL}?page=resume">resume</a></li>
                    <li><a href="${URL}?page=about">about</a></li>
                </ul>
            </div>
            <div id="content">
HTML

    if ($page =~ /resume/) {
        resumePage();
    }
  
    elsif ($page =~ /travels/) {
        travelsPage($TRAVDIR);
    }

    elsif ($page =~ /projects/) {
        projectsPage($PRJTDIR);
    }

    elsif ($page =~ /about/) {
        aboutPage();
    }

    elsif ($page =~ /source/) {
	$sourceparam = param('view');
	sourceViewPage($HOMEDIR,$SRCDIR,$PRJTDIR,$sourceparam);
    }

    elsif ($page =~ /search/) {
        homePage($HOMEDIR,$SRCDIR,$BLOGDIR,"search");
    }

    elsif ($page =~ /404/) {
        errorPage();
    }

    elsif ($blog) {
	$articleID = param('id');
	blogPage($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID);
    }

    else {
        homePage($HOMEDIR,$SRCDIR,$BLOGDIR,0,$year);
    }

    print(STDOUT <<HTML);
            </div>
            <div id="footer">
                <div id="footerleft">
                    $date
                </div>
                <div id="footermiddle">
                    <form name="query" action="" method=GET>
                        <input type="hidden" name="page" value="search">
                        <input type="text" name="query" value="">
                    </form>
                </div>
                <div id="footerright">
	            Contact <a href="mailto:paulie\@pauliesworld.org">Paul</a>
       	        </div>
            </div>
HTML
    print (STDOUT <<HTML);
        </div>
    </body>
</html>
HTML

}

1;
