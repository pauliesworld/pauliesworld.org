#!/usr/bin/perl

require "/home/paulie/release/CONFIGURE";

# Browser parameter variables
$page = param('page');
$query = param('query');
$content = param('content');

pworg_page_framework($page,$query,$HOMEDIR,$SRCDIR,$BLOGDIR,1);