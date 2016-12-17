#!/usr/bin/perl

sub openFile()
{
    ($entry)=@_;
    open(IN,"<${entry}") || print "<meta http-equiv=\"refresh\" content=\"0; url=${URL}\">";
    @content=<IN>;
    close(IN);
    return(\@content);
}

sub writeFile()
{
    ($file,$type,$field1,$field2,$field3)=@_;

    print "Content-type: text/html\r\n\r\n";

    if ($type =~ m/comment/) {
    	sysopen(OUT,$file,O_RDWR|O_CREAT);

    	if(flock(OUT, LOCK_EX)==0) {
            printf("A locked state has prevented the database committment");
    	}

        else {
	    print OUT "Name: $field1\nEmail: $field2\nComment:\n$field3";
            close(OUT);
        }
    }

    else {

    	print "Content-type: text/html\r\n\r\n";
    
	if ($type =~ m/comment/) {
    	    open(OUT,">$file");
    	    print OUT "Name: $field1\nEmail: $field2\nComment:\n$field3";
    	    close(OUT);
        }
    }
}

1;
