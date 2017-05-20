#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>.
# All rights reserved.
#
# pauliesworld.org source
# File: pworg_page_framework.pl
# 

sub pworg_page_framework() 
{
    ($page,$query,$HOMEDIR,$SRCDIR,$BLOGDIR,$blog,$year)=@_;
   
    $date = `${DATE} +'%B %e, %Y'`;
    chomp($date);
    $description="PauliesWorld.org is the personal website of Paul Johnson";

    if (!$page) {
        $page = "Paulie's World";
        $articleID = param('id');

        if ($blog && $articleID) {
            $page = $articleID;
            $header = `${GREP} 'Heading:' ${BLOGDIR}${articleID}.txt`;
            $header =~ s/Heading: //;
            $page = $header;
        }

        $title = $page;
        chomp($title);

    } else {
        $title = $page;

        if ($title !~ m/Paulie/) {
            $title =~ s/\b(\w)/\U$1/g;
        } elsif ($title =~ m/Resume/) {
            $title="Paul Johnson's Resume";
        } elsif ($title =~ m/About/) {
            $title="About Paul";
        } elsif ($title =~ m/Search/) {
            $title="Searching for \"$query\"...";
        } elsif ($title =~ m/Home/) {
            $title="Paulie's World";
        } elsif ($title =~ m/Travels/) {
            $title="Paul's Travels";

            if (param('location')) {
                $location = param('location');
                chomp($location);
                $title = `${GREP} 'Title:' ${TRAVDIR}${location}.txt`;
                $title =~ s/Title: //;
                chomp($title);
            }
        } elsif ($title =~ m/Source/) {
            $param_project = param('project');
            $projectptr=pworg_api_openfile("${PRJTDIR}${param_project}.txt");
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
        } elsif ($title =~ m/About/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/about.css\">\n";
        } elsif ($title =~ m/Project/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/project.css\">\n";
        } elsif ($page =~ m/resume/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/resume.css\">\n";
        } elsif ($page =~ m/travels/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/travels.css\">\n";
        } elsif ($page =~ m/source/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/source.css\">\n";
        } elsif ($title =~ m/404/) {
            print "        <link rel=\"stylesheet\" type=\"text/css\" href=\"${URL}css/error.css\">\n";
        }

print(STDOUT <<HTML);
        <link rel="shortcut icon" href="${URL}img/icon.ico">
        <meta name="keywords" content="pauliesworld paulie paulies world paul johnson broomfield colorado perl c java cpp solaris oracle sun unavco cu zfs storage dtrace zfssa amazon aws">
        <meta name="description" content="$description">
        <meta name="published_date" content="05/06/17 13:26:04 MST">
        <meta name="date" content="05/06/17 13:26:04 MST">
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
        pworg_page_resume();
    } elsif ($page =~ /travels/) {
        pworg_page_travels($TRAVDIR);
    } elsif ($page =~ /projects/) {
        pworg_page_projects($PRJTDIR);
    } elsif ($page =~ /about/) {
        pworg_page_about();
    } elsif ($page =~ /source/) {
        $sourceparam = param('view');
        pworg_page_sourceview($HOMEDIR,$SRCDIR,$PRJTDIR,$sourceparam);
    } elsif ($page =~ /search/) {
        pworg_page_home($HOMEDIR,$SRCDIR,$BLOGDIR,"search");
    } elsif ($page =~ /404/) {
        pworg_page_error();
    } elsif ($blog) {
        $articleID = param('id');
        $articleID .= ".txt";
        pworg_page_blog($HOMEDIR,$SRCDIR,$BLOGDIR,$articleID);
    } else {
        pworg_page_home($HOMEDIR,$SRCDIR,$BLOGDIR,0,$year);
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
