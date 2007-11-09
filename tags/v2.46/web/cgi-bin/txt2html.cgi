#!/usr/bin/perl -w -I.
use CGI;
use HTML::TextToHTML;
my $cgi = new CGI;
my $text = $cgi->param('text');
print $cgi->header();
my $conv = new HTML::TextToHTML(
	default_link_dict=>'');
print "<html>\n";
print "<head><title>txt2html</title></head>\n";
print "<body>\n";
my $html = $conv->process_chunk($text);
print $html;
print "</body></html>\n";
