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

my $conv = new HTML::TextToHTML(xhtml=>0);
ok( defined $conv, 'new() returned something' );
ok( $conv->isa('HTML::TextToHTML'), "  and it's the right class" );

$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
infile=>["tfiles/sample.txt"],
outfile=>"sample.html",
append_file=>"tfiles/sample.foot",
titlefirst=>1, mailmode=>1,
custom_heading_regexp=>['^ *--[\w\s]+-- *$'],
make_tables=>1,
);
ok($result, 'converted sample.txt');

# compare the files
$result = compare('tfiles/good_sample.html', 'sample.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('sample.html');
}

