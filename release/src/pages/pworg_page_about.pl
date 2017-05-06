#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>.
# All rights reserved.
#
# pauliesworld.org source
# File: pworg_page_about.pl
# 

sub pworg_page_about()
{
    print (STDOUT <<HTML);
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                <script type="text/javascript">
                    \$(function() {

                        \$("#aboutslideshow > div:gt(0)").hide();

                        setInterval(function() { 
                            \$('#aboutslideshow > div:first')
                            .fadeOut(1000)
                            .next()
                            .fadeIn(1000)
                            .end()
                            .appendTo('#aboutslideshow');
                        },  2500);

                    });
                </script>
                <div id="about">
                    My name's Paul Johnson and I'm a systems engineer at <a href="https://aws.amazon.com/">Amazon</a> in <a href="http://en.wikipedia.org/wiki/Broomfield,_Colorado">Broomfield, Colorado</a>.
                    <div id="aboutslideshow">
                        <div>
                            <img src="/img/portrait-1.jpg" width="256" alt="portrait-1">
                        </div>
                        <div>
                            <img src="/img/portrait-2.jpg" width="256" alt="portrait-2">
                        </div>
                        <div>
                            <img src="/img/portrait-3.jpg" width="256" alt="portrait-3">
                        </div>
                        <div>
                            <img src="/img/portrait-4.jpg" width="256" alt="portrait-4">
                        </div>
                        <div>
                            <img src="/img/portrait-5.jpg" width="256" alt="portrait-5">
                        </div>
                    </div>
                    <div id="aboutlinks">
                        <ul>
                            <li>
                                <img src="/img/facebook_icon.png" alt="facebook_icon">
                            </li>
                            <li>
                                <a target="_blank" href="http://www.facebook.com/paulie">Facebook Profile</a>
                            </li>
                            <li>
                                <img src="/img/linkedin_icon.png" alt="linkedin_icon">
                            </li>
                            <li>
                                <a target="_blank" href="https://www.linkedin.com/in/pjcolorado/">Linkedin Profile</a>
                            </li>
                            <li>
                                <img src="/img/github_icon.png" alt="github_icon">
                            </li>
                            <li>
                                <a target="_blank" href="https://www.github.com/pauliesworld/">Github Repository</a>
                            </li>
                        </ul>
                    </div>
                </div>
HTML
}

1;
