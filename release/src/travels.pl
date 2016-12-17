#!/usr/bin/perl

sub travelsPage()
{
    ($TRAVDIR) = @_;
    $param_location = param('location');
    chomp($param_location);

    if ($param_location) {
        viewGallery($TRAVDIR,$param_location)
    } else {
	@traveltable = `ls -1 ${TRAVDIR}`;
	@traveltable = reverse(@traveltable);

	foreach $location (@traveltable) {
	    chomp($location);
            $locationptr=openFile("${TRAVDIR}${location}");
            @locationinfo = @$locationptr;

            @location_title = grep(/Title:/,@locationinfo);
            $location_title = "@location_title";
	    $location_title =~ s/Title:\ //;
            chomp($location_title);

            @location_date = grep(/Date:/,@locationinfo);
            $location_date = "@location_date";
            $location_date =~ s/Date:\ //;
            chomp($location_date);

            $location =~ s/.txt//;
	    print "\t\t<div class=\"location\">\n";
	    print "\t\t    <div class=\"locationtitle\">\n";
            print "\t\t\t<a href=\"${URL}?page=travels\&amp;location=${location}\">$location_title</a>\n";
	    print "\t\t    </div>\n";
	    print "\t\t    <div class=\"locationdate\">\n";
            print "\t\t\t$location_date\n";
	    print "\t\t    </div>\n";
            print "\t\t</div>\n";
	}
	print "\t\t<div class=\"location\">\n\t\t</div>\n";
    }
}

sub viewGallery()
{
    ($TRAVDIR,$param_location) = @_;
    
    $locationptr=openFile("${TRAVDIR}${param_location}.txt");
    @locationinfo = @$locationptr;
        
    @location_title = grep(/Title:/,@locationinfo);
    $location_title = "@location_title";
    $location_title =~ s/Title:\ //;
    chomp($location_title);
    @location_date = grep(/Date:/,@locationinfo);
    $location_date = "@location_date";
    $location_date =~ s/Date:\ //;
    chomp($location_date);

    @location_description = grep(/Description/,@locationinfo);
    $description_size = @location_description;

    print (STDOUT <<HTML);
                <div id="galleryinfo">
                    <div id="gallerytitle">
                        $location_title
                    </div>
                    <div id="gallerydate">
                        $location_date
                    </div>
                </div>

                <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
                <script type="text/javascript">
                    \$(document).ready(function() {
                        \$("#galleryselect").on('hover', 'span', function() {
                            \$("#gallery img").removeClass("selected");

                            var newImage = \$(this).index();

                            \$("#gallery img").eq(newImage).addClass("selected");
                            \$("#galleryselect span").removeClass("selected");

                            \$(this).addClass("selected");
                        });
                    });
                </script>

                <div id="gallery">
                    <img class="selected" src="/img/travels/${param_location}-0.png" height="400" alt="${param_location}-0">
HTML

    for ($i=1; $i <= $description_size; $i++) {
        print "\t\t    <img src=\"/img/travels/${param_location}-${i}.png\" height=\"400\" alt=\"${param_location}-${i}\">\n";
    }
    print (STDOUT <<HTML);
                </div>
                <div id="galleryselect">
                    <span class="selected"><img src="/img/travels/${param_location}-0s.png" height="60" alt="${param_location}-0s"></span>
HTML
    for ($i=1; $i < $description_size; $i++) {
        print "\t\t    <span><img src=\"/img/travels/${param_location}-${i}s.png\" height=\"60\" alt=\"${param_location}-${i}s\"></span>\n";
    }
    print (STDOUT <<HTML);
                </div>
HTML
}

1;
