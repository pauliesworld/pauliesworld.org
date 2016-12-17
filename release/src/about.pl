#!/usr/bin/perl

sub
aboutPage()
{
    print (STDOUT <<HTML);
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
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
                    My name's Paul Johnson and I'm a software engineer at <a href="./img/paulie-oraclebroomfield.jpg">Oracle</a> in <a href="http://en.wikipedia.org/wiki/Broomfield,_Colorado">Broomfield, Colorado</a>.
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
                                <img src="/img/oracle_icon.png" alt="oracle_icon">
                            </li>
			    <li>
                                <a target="_blank" href="http://blogs.oracle.com/paulie">Oracle Blog</a>
                            </li>
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
                                <a target="_blank" href="https://www.linkedin.com/pub/paul-johnson/b/5ba/7a2">Linkedin Profile</a>
                            </li>
                            <li>
                                <img src="/img/deviantart_icon.png" alt="deviantart_icon">
                            </li>
                            <li>
                                <a target="_blank" href="http://pauliesworld.deviantart.com/">DeviantArt Profile</a>
                            </li>
                        </ul>
                    </div>
                </div>
HTML
}

1;
