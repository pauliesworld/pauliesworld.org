#!/usr/bin/perl

require "CONFIGURE";

# Browser parameter variables
$page = param('page');
$query = param('query');
$content = param('content');
$year = param('year');

pwFramework($page,$query,$HOMEDIR,$SRCDIR,$BLOGDIR,0,$year);
