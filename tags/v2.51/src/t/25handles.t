# miscelaneous tests for filehandles

#########################

use Test::More tests => 6;
use HTML::TextToHTML;

#########################

# compare two files
sub compare {
    my $file1 = shift;
    my $file2 = shift;

    if (!open(F1, $file1))
    {
    	print "error - $file1 did not open\n";
	return 0;
    }
    if (!open(F2, $file2))
    {
    	print "error - $file2 did not open\n";
	return 0;
    }

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

#-----------------------------------------------------------------

my $conv = new HTML::TextToHTML();

#
# FILEHANDLE
#

open (IN, "tfiles/hyphens.txt")
or die "could not open tfiles/hyphens.txt";

$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
extract=>1,
inhandle=>[\*IN],
outfile=>"fh_hyphens.html",
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted (FH) hyphens.txt');

# compare the files
$result = compare('tfiles/good_hyphens.html', 'fh_hyphens.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('fh_hyphens.html');
}

#
# filehandle variable
#
$conv = undef;
$conv = new HTML::TextToHTML();

my $fh;
open ($fh, "tfiles/hyphens.txt")
or die "could not open tfiles/hyphens.txt";

$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
extract=>1,
inhandle=>[$fh],
outfile=>"fh2_hyphens.html",
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted (FH 2) hyphens.txt');

# compare the files
$result = compare('tfiles/good_hyphens.html', 'fh2_hyphens.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('fh2_hyphens.html');
}

#
# Output filehandle
#
$conv = undef;
$conv = new HTML::TextToHTML();

my $ofh;
open ($ofh, ">", "fh3_hyphens.html")
or die "could not open fh3_hyphens.html for writing";

$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
extract=>1,
infile=>['tfiles/hyphens.txt'],
outhandle=>$ofh,
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted (FH 3) hyphens.txt');

# compare the files
$result = compare('tfiles/good_hyphens.html', 'fh3_hyphens.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('fh3_hyphens.html');
}

