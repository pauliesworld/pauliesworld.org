#!/usr/bin/perl

sub sourceViewPage()
{
    ($HOMEDIR,$SRCDIR,$PRJTDIR,$filename)=@_;

    $param_project = param('project');
    chomp($param_project);
    chomp($param_view);

    $projectptr=openFile("${PRJTDIR}${param_project}.txt");
    @projectinfo = @$projectptr;

    @project_title = grep(/Title:/,@projectinfo);
    $project_title = "@project_title";
    $project_title =~ s/Title:\ //;
    chomp($project_title);

    @project_download = grep(/Download:/,@projectinfo);
    $project_download = "@project_download";
    $project_download =~ s/Download:\ //;
    chomp($project_download);

    @project_downloadurl = grep(/DownloadURL:/,@projectinfo);
    $project_downloadurl = "@project_downloadurl";
    $project_downloadurl =~ s/DownloadURL:\ //;
    chomp($project_downloadurl);
    $project_downloadurlbasename = basename($project_downloadurl);

    @project_viewable = grep(/Viewable:/,@projectinfo);
    $project_viewable = "@project_viewable";
    $project_viewable =~ s/Viewable:\ //;
    chomp($project_viewable);

    @project_description = grep(/Description:/,@projectinfo);

    foreach $desc (@project_description) {
        $desc =~ s/Description:/- /;
        chomp($desc);
        $desc .= "<br>\n";
    }

    if ($project_viewable !~ m/FALSE/) {
        $filecontentsptr=openFile("${HOMEDIR}${project_viewable}");
        @filecontents = @$filecontentsptr;

        foreach $line (@filecontents) {
	    # <pre> tag doesn't like those god damn carrots

	    if ($line =~ m/</) {
	        $line =~ s/</\&lt\;/g;
	    }
        }
    }

    print (STDOUT <<HTML);
                <div class="source">
                    <div class="sourceinfo">
                        <b> ${project_title} </b> <br>
                        Download: <a href="${project_downloadurl}">${project_downloadurlbasename}</a> <br>
                        Author: paulie <br>
                        License: n/a <br> 
                        Description: <br>
                        @project_description
                   </div>
                   <pre>
HTML
    print @filecontents;
    print (STDOUT <<HTML);
                  </pre>
              </div>
HTML

}

1;
