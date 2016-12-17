#!/usr/bin/perl

sub resumePage()
{
    print (STDOUT <<HTML);
                <script type="text/javascript" src="/js/overlib.js">
                </script>
                <center>
                    <br><br>
                    <img id="resume" src="/resume/resume.png" usemap="#resume" alt="resume">
                    <map id="resume-map" name="resume">
                        <area shape="rect" coords="383,67,539,85" href="mailto:paulie\@pauliesworld.org" alt="paulie\@pauliesworld.org">
                        <area shape="rect" coords="393,82,539,100" href="http://www.pauliesworld.org/" alt="pauliesworld.org" >
                        <area shape="rect" coords="134,235,695,382" href="#" onmouseover="return overlib('<img src=/img/cu2-peak.jpg width=600 height=338>',CAPTION,'near Jasper Peak, Eldora CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="cu2-peak.jpg">
                        <area shape="rect" coords="134,431,695,707" href="#" onmouseover="return overlib('<img src=/img/fishworks-peak.jpg width=600 height=338>',CAPTION,'Sniktau - Loveland Pass, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="fishworks-peak.jpg">
                        <area shape="rect" coords="134,710,695,953" href="#" onmouseover="return overlib('<img src=/img/oracle-peak.jpg width=600 height=338>',CAPTION,'South Arapaho Peak - Eldora, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="oracle-peak.jpg">
                        <area shape="rect" coords="134,955,695,1195" href="#" onmouseover="return overlib('<img src=/img/sun-peak.jpg width=600 height=338>',CAPTION,'Shoshoni Peak - Ward, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="sun-peak.jpg">
                        <area shape="rect" coords="134,1198,695,1423" href="#" onmouseover="return overlib('<img src=/img/unavco-peak.jpg width=600 height=338>',CAPTION,'Grizzly Peak - Loveland Pass, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt="unavco-peak.jpg">
                        <area shape="rect" coords="134,1426,695,1567" href="#" onmouseover="return overlib('<img src=/img/cu-peak.jpg width=600 height=338>',CAPTION,'James Peak - Alice, CO',WIDTH,600,HAUTO,VAUTO);" onmouseout="return nd()" alt=cu-peak.jpg>
                        <area shape="rect" coords="134,1849,418,1868" href="http://www.pauliesworld.org/?page=projects" alt="projects">
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
                                    Larry Fosdick Award Nomination

                        Experience
                            Oracle Corporation
                            Broomfield, CO
                            Principal Software Engineer
                               Integral member of a team of system engineers tasked to map out bleeding edge and large-scale use cases advanced by customers of the Oracle ZFS Storage Appliance
                               Led sales proof-of-concepts across the United States in addition to Sweden, Mexico, and New Zealand, bringing in over \$6 million in revenue
                               Authored 3 whitepapers, support documentation, and created a web blog to assist the sales and service teams
                               Architected test plans for the quality assurance organization covering features such as replication, deduplication, and ZFS Analytics
                               Presented at Oracle OpenWorld from 2012 \arrowsymbol 2015 on topics including ZFS Analytics, ZFS RESTful API, Oracle Database 12c (dNFS / HCC / RMAN), and MySQL

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
                               Managed over 100 independent hardware vendors (IHV) by providing development support for device drivers on Solaris 10 and OpenSolaris
                               Conducted interoperability testing of IHV products resulting in over 60 completed projects
                               Re-evaluated hardware testing strategies by rewriting 7 test plans covering USB, KVM, storage, printing, audio, graphics, and network connectivity
                               Administered a cluster of 18 SPARC and x64-based Sun servers used in the testing and certification of third party hardware products

                            UNAVCO, Inc.
                            Boulder, CO
                            Systems Administrator
                               Maintained an environment of Sun based Solaris servers with hardware upgrades, patching, and installs via the JumpStart architecture
                               Wrote numerous Perl scripts to communicate with locations via satellite as far out as Greenland and Antarctica
                               Built a custom Windows MSI package manager alongside Ghost imaging to fully automate new machine installations
                               Deployed an OpenLDAP directory system to more efficiently manage employee authentication

                            University of Colorado
                            Broomfield, CO
                            Support Analyst                            
                            Provided computer support to 40,000 faculty, staff, and students via e-mail and phone
                               Utilized the Windows, Macintosh, and UNIX platforms to troubleshoot various problems
                               Supported a campus wide e-mail migration that involved personal communication with over 500 customers
                               Handled in excess of 3000 support cases during employment

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
