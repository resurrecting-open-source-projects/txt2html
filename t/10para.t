#########################

use Test::More tests => 18;
use HTML::TextToHTML;
ok(1); # If we made it this far, we are ok.

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

my $conv = new HTML::TextToHTML();
ok( defined $conv, 'new() returned something' );
ok( $conv->isa('HTML::TextToHTML'), "  and it's the right class" );

$conv->args(
	system_link_dict=>'txt2html.dict',
	default_link_dict=>'',
	);

#
# test the process_para method alone
#
$test_str = "Matty had a little truck
he drove it round and round
and everywhere that Matty went
the truck was *always* found.
";

$ok_str = "<p>Matty had a little truck<br/>
he drove it round and round<br/>
and everywhere that Matty went<br/>
the truck was <em>always</em> found.
</p>";

$out_str = $conv->process_para($test_str);
ok($out_str, 'converted sample string');

# compare the result
is($out_str, $ok_str, 'compare converted string with OK string');

#
# test the process_chunk method with an ordered list
#
$test_str = "Here is my list:

1. Spam
2. Jam
3. Ham
4. Pickles
";

$ok_str = "<p>Here is my list:
</p><ol>
  <li>Spam
  </li><li>Jam
  </li><li>Ham
  </li><li>Pickles</li></ol>
";

$out_str = $conv->process_chunk($test_str);
ok($out_str, 'converted sample string with list');

# compare the result
is($out_str, $ok_str, 'compare converted list string with OK list string');

#
# test the process_chunk method with an empty string
#
$test_str = "";

$ok_str = "";

$out_str = $conv->process_chunk($test_str);
# note we do not do an ok on this because it should be empty

# compare the result
is($out_str, $ok_str, 'compare converted empty string with OK empty string');

#
# test with is_fragment
#
$test_str = "Matty had a little truck
he drove it round and round
and everywhere that Matty went
the truck was *always* found.
";

$ok_str = "Matty had a little truck<br/>
he drove it round and round<br/>
and everywhere that Matty went<br/>
the truck was <em>always</em> found.
";

$out_str = $conv->process_chunk($test_str, is_fragment=>1);
ok($out_str, 'converted sample string');

# compare the result
is($out_str, $ok_str, 'compare converted string with OK string');

#
# test the process_para method with a URL
#
$test_str = "I like to look at http://www.example.com a lot";

$ok_str = 'I like to look at <a href="http://www.example.com">http://www.example.com</a> a lot';

$out_str = $conv->process_para($test_str, is_fragment=>1);
ok($out_str, 'converted sample string with URL');

# compare the result
is($out_str, $ok_str, 'compare converted URL string with OK URL string');

#
# test process_chunk with caps_tag turned off
#
$test_str = "We have a line alone
FULL OF CAPS AND FURY
";

$ok_str = "We have a line alone<br/>
FULL OF CAPS AND FURY
";

$conv->args(caps_tag=>'');
$out_str = $conv->process_chunk($test_str, is_fragment=>1);
ok($out_str, 'converted sample string with CAPS');

# compare the result
is($out_str, $ok_str, 'compare converted CAPS string with OK CAPS string');

$conv->args(caps_tag=>'STRONG'); # restore caps to default

#
# Test with different italic/bold delimiters
#
$test_str = "I am ^bold^,
You are --really krazy--.
-----------------
";

$ok_str = "I am <strong>bold</strong>,<br/>
You are <em>really krazy</em>.
<hr/>
";

$conv->args(bold_delimiter=>'^',
	italic_delimiter=>'--');
$out_str = $conv->process_chunk($test_str, is_fragment=>1);
ok($out_str, 'converted sample string with delimiters');

# compare the result
is($out_str, $ok_str, 'compare converted delimiter string with OK delimiter string');

# 
# test with no bolding or italic at all
$test_str = "I am ^bold^,
You are --really krazy--.
-----------------
";

$ok_str = "I am ^bold^,<br/>
You are --really krazy--.
<hr/>
";

$conv->args(bold_delimiter=>'',
	italic_delimiter=>'');
$out_str = $conv->process_chunk($test_str, is_fragment=>1);
ok($out_str, 'converted sample string with no bold');

# compare the result
is($out_str, $ok_str, 'compare converted no-bold string with OK no-bold string');

# restore default
$conv->args(bold_delimiter=>'#',
	italic_delimiter=>'*');
