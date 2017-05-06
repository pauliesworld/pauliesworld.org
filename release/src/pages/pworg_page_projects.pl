#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_page_projects.pl
# 

sub pworg_page_projects()
{
   ($PRJTDIR) = @_;

    print (STDOUT <<HTML);
                <div class="projectabout">
                    Most of these programs were developed on either a FreeBSD or Solaris system with the GNU compiling environment.  I hold no responsiblity for any misuse of these files.
                </div>
HTML

        @projecttable = `ls -1 ${PRJTDIR}`;

        foreach $project (@projecttable) {
            chomp($project);
            $projectptr=pworg_api_openfile("${PRJTDIR}${lowercase_cat}/${project}");
            @projectinfo = @$projectptr;

            @project_title = grep(/Title:/,@projectinfo);
            $project_title = "@project_title";
            $project_title =~ s/Title:\ //;
            chomp($project_title);

            @project_demo = grep(/Demo:/,@projectinfo);
            $project_demo = "@project_demo";
            $project_demo =~ s/Demo:\ //;
            chomp($project_demo);

            @project_demourl = grep(/DemoURL:/,@projectinfo);
            $project_demourl = "@project_demourl";
            $project_demourl =~ s/DemoURL:\ //;
            chomp($project_demourl);

            @project_download = grep(/Download:/,@projectinfo);
            $project_download = "@project_download";
            $project_download =~ s/Download:\ //;
            chomp($project_download);

            @project_downloadurl = grep(/DownloadURL:/,@projectinfo);
            $project_downloadurl = "@project_downloadurl";
            $project_downloadurl =~ s/DownloadURL:\ //;
            chomp($project_downloadurl);

            @project_source = grep(/Source:/,@projectinfo);
            $project_source = "@project_source";
            $project_source =~ s/Source:\ //;
            chomp($project_source);

            @project_sourceurl = grep(/SourceURL:/,@projectinfo);
            $project_sourceurl = "@project_sourceurl";
            $project_sourceurl =~ s/SourceURL:\ //;
            chomp($project_sourceurl);

            @project_paper = grep(/Paper:/,@projectinfo);
            $project_paper = "@project_paper";
            $project_paper =~ s/Paper:\ //;
            chomp($project_paper);

            @project_paperurl = grep(/PaperURL:/,@projectinfo);
            $project_paperurl = "@project_paperurl";
            $project_paperurl =~ s/PaperURL:\ //;
            chomp($project_paperurl);

            @project_platforms = grep(/Platforms:/,@projectinfo);
            $project_platforms = "@project_platforms";
            $project_platforms =~ s/Platforms:\ //;
            chomp($project_platforms);

            @project_description = grep(/Description:/,@projectinfo);

            foreach $desc (@project_description) {
                $desc =~ s/Description:/- /;
                chomp($desc);
                $desc .= "<br>\n";
            }

            print "\t\t<div class=\"project\">\n";
            print "\t\t    <div class=\"projecttitle\">\n";
            print "\t\t\t$project_title \n";
            print "\t\t    </div>\n";
            print "\t\t    <div class=\"projectdescription\">\n";

            foreach $desc (@project_description) {
                print "\t\t\t$desc";
            }

            print "\t\t    </div>\n";
            print "\t\t    <div class=\"projectlinks\">\n";

            if ($project_demo =~ m/TRUE/) {
                print "\t\t\t[ <a href=\"${project_demourl}\">Demo</a> ] \n";
            }

            if ($project_source =~ m/TRUE/) {
                print "\t\t\t[ <a href=\"${project_sourceurl}\">View Source</a> ] \n";
            }

            if ($project_download =~ m/TRUE/) {
                print "\t\t\t[ <a href=\"${project_downloadurl}\">Download</a> ] \n";
            }

            if ($project_paper =~ m/TRUE/) {
                print "\t\t\t[ <a href=\"${project_paperurl}\">Paper</a> ] \n";
            }

            print "\t\t    </div>\n";
            print "\t\t</div>\n";
        }

    print (STDOUT <<HTML);
HTML
}

1;
