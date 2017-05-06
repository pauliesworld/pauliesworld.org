#!/usr/bin/perl

require "/home/paulie/release/CONFIGURE";

# Browser parameter variables
$page = param('page');
$query = param('query');
$content = param('content');
$year = param('year');

pworg_page_framework($page,$query,$HOMEDIR,$SRCDIR,$BLOGDIR,0,$year);
