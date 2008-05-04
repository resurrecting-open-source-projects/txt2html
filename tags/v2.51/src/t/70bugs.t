# files which have triggered bugs

#########################

use Test::More tests => 16;
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
	# remove newline/carriage return (in case these are not both Unix)
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
# bugs : make_tables
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_tables=>1,
infile=>["tfiles/robo.txt"],
outfile=>"robo.html",
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted robo.txt');

# compare the files
$result = compare('tfiles/good_robo.html', 'robo.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('robo.html');
}

#
# bugs : list with bold chars
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_tables=>0,
infile=>["tfiles/mixed.txt"],
outfile=>"mixed.html",
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted mixed.txt');

# compare the files
$result = compare('tfiles/good_mixed.html', 'mixed.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('mixed.html');
}

#
# bugs : dos file on unix platform not detecting headings
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_tables=>0,
infile=>["tfiles/heading1.txt"],
outfile=>"heading1.html",
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted heading1.txt');

# compare the files
$result = compare('tfiles/good_heading1.html', 'heading1.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('heading1.html');
}

#
# bugs : link with # in it being replaced by <STRONG> tags
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_tables=>0,
infile=>["tfiles/links3.txt"],
outfile=>"links3.html",
custom_heading_regexp=>[],
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted links3.txt');

# compare the files
$result = compare('tfiles/good_links3.html', 'links3.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('links3.html');
}

$conv = new HTML::TextToHTML();
#
# bugs : file with umlauts not doing italics and unterlines correctly
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_tables=>0,
infile=>["tfiles/umlauttest.txt"],
outfile=>"umlauttest.html",
custom_heading_regexp=>[],
xhtml=>1,
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted umlauttest.txt');

# compare the files
$result = compare('tfiles/good_umlauttest.html', 'umlauttest.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('umlauttest.html');
}

#
# bugs : UTF-8 characters are being wrongly zapped
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_anchors=>0,
infile=>["tfiles/utf8.txt"],
outfile=>"utf8.html",
custom_heading_regexp=>[],
xhtml=>1,
extract=>1,
eight_bit_clean=>1,
#debug=>1,
#dict_debug=>15,
);
ok($result, 'converted utf8.txt');

# compare the files
$result = compare('tfiles/good_utf8.html', 'utf8.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('utf8.html');
}

#
# bugs : italics with punctuation characters , and ! not converted
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_anchors=>0,
infile=>["tfiles/punct.txt"],
outfile=>"punct.html",
custom_heading_regexp=>[],
extract=>1,
eight_bit_clean=>1,
);
ok($result, 'converted punct.txt');

# compare the files
$result = compare('tfiles/good_punct.html', 'punct.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('punct.html');
}

#
# bugs : links with underscores
#
$result = $conv->txt2html(
system_link_dict=>"txt2html.dict",
default_link_dict=>"",
make_anchors=>0,
infile=>["tfiles/links4.txt"],
outfile=>"links4.html",
custom_heading_regexp=>[],
extract=>1,
eight_bit_clean=>1,
);
ok($result, 'converted links4.txt');

# compare the files
$result = compare('tfiles/good_links4.html', 'links4.html');
ok($result, 'test file matches original example exactly');
if ($result) {
    unlink('links4.html');
}

