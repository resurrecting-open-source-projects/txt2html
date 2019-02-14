# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 5;
use HTML::TextToHTML;
ok(1); # If we made it this far, we're ok.

#########################

# compare two files
sub compare {
    my $file1 = shift;
    my $file2 = shift;

    open(F1, $file1) || return 0;
    open(F2, $file2) || return 0;

    my $res = 1;
    my $count = 0;
    while (<F1>)
    {
	$count++;
	my $comp1 = $_;
	# remove newline/carriage return (in case these aren't both Unix)
	$comp1 =~ s/\n//;
	$comp1 =~ s/\r//;

	my $comp2 = <F2>;

	# check if F2 has less lines than F1
	if (!defined $comp2)
	{
	    print "error - line $count does not exist in $file2\n  $file1 : $comp1\n";
	    close(F1);
	    close(F2);
	    return 0;
	}

	# remove newline/carriage return
	$comp2 =~ s/\n//;
	$comp2 =~ s/\r//;
	if ($comp1 ne $comp2)
	{
	    print "error - line $count not equal\n  $file1 : $comp1\n  $file2 : $comp2\n";
	    close(F1);
	    close(F2);
	    return 0;
	}
    }
    close(F1);

    # check if F2 has more lines than F1
    if (defined($comp2 = <F2>))
    {
	$comp2 =~ s/\n//;
	$comp2 =~ s/\r//;
	print "error - extra line in $file2 : '$comp2'\n";
	$res = 0;
    }

    close(F2);

    return $res;
}

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

my $conv = new HTML::TextToHTML();
ok( defined $conv, 'new() returned something' );
ok( $conv->isa('HTML::TextToHTML'), "  and it's the right class" );

my %args = ();
$args{system_link_dict} = "txt2html.dict";
$args{default_link_dict} = "";
$args{infile} = ["tfiles/sample.txt"];
$args{append_file} = "tfiles/sample.foot2";
$args{titlefirst} = 1;
$args{mailmode} = 1;
$args{custom_heading_regexp} = ['^ *--[\w\s]+-- *$'];
$args{make_tables} = 1;
$args{make_anchors} = 1;
$args{xhtml} = 1; 
$args{outfile} =  "xhtml_sample.html";
$result = $conv->txt2html(%args);
ok($result, 'converted xhtml sample.txt');

# compare the files
$result = compare('tfiles/good_xhtml_sample.html', 'xhtml_sample.html');
ok($result, 'test file xhtml_sample.html matches original good_xhtml_sample.html exactly');

if ($result) {
    unlink('xhtml_sample.html');
}
