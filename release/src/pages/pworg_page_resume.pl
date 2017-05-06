#!/usr/bin/perl

#
# Copyright (c) 2017, Paul Johnson <paulie@pauliesworld.org>. All rights reserved.
#
# pauliesworld.org source
# File: pworg_page_resume.pl
# 

sub pworg_page_resume()
{
    print (STDOUT <<HTML);
                <script type="text/javascript" src="/js/overlib.js">
                </script>
                <center>
                    <br><br>
                    <img id="resume" src="/resume/resume.png" width="800" usemap="#resume" alt="resume">
                    <map id="resume-map" name="resume">
                        <area shape="rect" coords="460,70,625,88" href="http://www.pauliesworld.org" alt="www.pauliesworld.org">
                        <area shape="rect" coords="450,90,625,108" href="mailto:paulie\@pauliesworld.org" alt="paulie\@pauliesworld.org" >
                        <area shape="rect" coords="447,110,625,126" href="http://www.github.com/pauliesworld" alt="github.com/pauliesworld">
                        <area shape="rect" coords="435,128,625,144" href="http://www.linkedin.com/in/pjcolorado" alt="linkedin.com/in/pjcolorado" >
                        <area shape="rect" coords="65,330,140,430" href="#" onmouseover="return overlib('<img src=/img/cu-peak.jpg width=600 height=338>',CAPTION,'James Peak - Alice, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="cu2-peak.jpg">
                        <area shape="rect" coords="65,555,140,655" href="#" onmouseover="return overlib('<img src=/img/amzn-peak.jpg width=600 height=338>',CAPTION,'Northstar Mountain - Hoosier Pass, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="amzn-peak.jpg">
                        <area shape="rect" coords="65,880,140,980" href="#" onmouseover="return overlib('<img src=/img/fishworks-peak.jpg width=600 height=338>',CAPTION,'Sniktau - Loveland Pass, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="fishworks-peak.jpg">
                        <area shape="rect" coords="65,1230,140,1330" href="#" onmouseover="return overlib('<img src=/img/oracle-peak.jpg width=600 height=338>',CAPTION,'South Arapaho Peak - Eldora, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="oracle-peak.jpg">
                        <area shape="rect" coords="65,1490,140,1590" href="#" onmouseover="return overlib('<img src=/img/sun-peak.jpg width=600 height=338>',CAPTION,'Shoshoni Peak - Ward, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="sun-peak.jpg">
                        <area shape="rect" coords="65,1745,140,1845" href="#" onmouseover="return overlib('<img src=/img/unavco-peak.jpg width=600 height=338>',CAPTION,'Grizzly Peak - Loveland Pass, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="unavco-peak.jpg">
                    </map>
                    <br><br>
                    <div class="hidden">
                        Education
                            University of Colorado
                            Boulder, CO
                            B.S. Computer Science
                                Senior Project: Perl-based Scheduling System for CWA
                                    2008 ITL Design Expo Best in Section Award
                                Bioinformatics Project: Discovery of HuR binding sites using a machine learning approach
                                    2008 Larry Fosdick Award Nomination

                        Experience
                            Amazon Web Services
                            Broomfield, CO
                            Systems Engineer
                        
                            Oracle Corporation
                            Broomfield, CO
                            Principal Software Engineer
                               Integral member of a team of system engineers tasked to map out bleeding edge and large-scale use cases advanced by customers of the Oracle ZFS Storage Appliance
                               Led sales proof-of-concepts across the United States in addition to Sweden, Mexico, and New Zealand, bringing in over \$8 million in revenue
                               Authored 3 whitepapers, support documentation, and created a web blog to assist the sales and service teams
                               Architected test plans and led multiple software releases for the quality assurance organization, covering features such as replication, deduplication, and ZFS Analytics
                               Built a deployment API for Oracle VM to serve hundreds of virtual machines for QA
                               Presented at Oracle OpenWorld from 2012 \arrowsymbol 2016 on topics including ZFS Analytics, ZFS RESTful API, Oracle Database 12c (dNFS / HCC / RMAN), and MySQL

                            Oracle Corporation
                            Broomfield, CO
                            Senior Software Engineer
                               Primary test lead for the integration of the Oracle ZFS Storage Appliance with the Oracle Exalogic Elastic Cloud and Oracle SuperCluster
                               Engaged in storage ecosystem testing encompassing Oracle Database 11g/12c, Oracle VM, and the Oracle Virtual Compute Appliance
                               Qualified the Xsigo I/O Fabric Director (now Oracle Fabric Interconnect) with the Oracle ZFS Storage Appliance
                               Led training sessions for customers, sales consultants, quality assurance engineers, and partners in Florida, California, New York, Hungary, India, Japan, and Israel

                            Sun Microsystems, Inc.
                            Broomfield, CO
                            Software Engineer
                               Provided development support for device drivers on Solaris 10 and OpenSolaris for more than 100 different independent hardware vendors (IHV)
                               Conducted interoperability testing of IHV products resulting in over 60 completed projects
                               Re-evaluated hardware testing strategies by rewriting 7 test plans covering USB, KVM, storage, printing, audio, graphics, and network connectivity
                               Administered a cluster of 18 SPARC and x64-based Sun servers used in the testing and certification of third party hardware products

                            UNAVCO, Inc.
                            Boulder, CO
                            Systems Administrator
                               Maintained an environment of Solaris servers involving installs, upgrades, and patching
                               Constructed a Perl-based framework to automate satellite communication and gather weather telemetry data in Greenland and Antarctica
                               Built a custom Windows MSI package manager alongside Ghost imaging to fully automate new machine installations
                               Deployed an OpenLDAP directory system to manage employee authentication

                            University of Colorado
                            Broomfield, CO
                            Technical Support Analyst                            

                        Certifications
                            Oracle Certified Solaris 10 System Administrator (SCSA)
                            Oracle Certified Solaris 10 Network Administrator (SCNA) 
                            Oracle Certified Solaris 10 Security Administrator (SCSECA)

                        Expertise
                            Systems
                                FreeBSD, Linux, Mac OS X, Solaris, Windows
                            Languages
                                Bash, C, C++, Perl, Python, SQL
                            Tools
                                Active Directory, BIND, DTrace, OpenLDAP, Mercurial, MySQL, Subversion, vi
                            Examples

                                Examples of my programming work can be found here:
                                http://www.pauliesworld.org/?page=projects

                             xxx xxxxxx Dr. Broomfield, CO 80020 <br>
                             ☎ 720-xxx-xxxx ✉ paulie\@pauliesworld.org ♨ http://www.pauliesworld.org
                    </div>
                    <center>
                        <font color="#000000" face="arial" size="2">
                            [ <a href="./resume/resume-public.pdf">pdf format</a> ] <br><br><br>
                        </font>
                    </center>
                </center>
HTML
}

1;
