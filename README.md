# txt2html
**Convert plain text file to HTML**


<br><br>
**1. HELP THIS PROJECT**<br>
**2. WHAT IS TXT2HTML?**<br>
**3. WHAT IS TXT2HTML NOT?**<br>
**4. HOW TO INSTALL AND USE**<br>



--------------------
1. HELP THIS PROJECT
--------------------

txt2html needs your help. **If you are a Perl programmer** and if you wants
to help a nice project, this is your opportunity.

My name is Eriberto and **I am not a Perl developer**. I imported txt2html
from its old repositories[1][2] to GitHub (the original developer is
inactive[3]). After this, I applied all patches found in Debian project and
other places for this program. All my work was registered in ChangeLog
file (version 2.53 and later releases). I also maintain txt2html packaged in
Debian[4].

If you are interested to help txt2html, read the [CONTRIBUTING.md](CONTRIBUTING.md) file.

[1] http://txt2html.sourceforge.net
[2] https://metacpan.org/release/txt2html
[3] Kathryn Andersen (RUBYKAT) told me in a private email message that is
    inactive because a personal problem. So, txt2html needs help!
[4] https://tracker.debian.org/pkg/txt2html


--------------------
2. WHAT IS TXT2HTML?
--------------------

txt2html is a Perl program that converts plain text to HTML, using
HTML::TextToHTML Perl module.

It supports headings, lists, simple character markup, and hyperlinking, and
is highly customizable. It recognizes some of the apparent structure of the
source document (mostly whitespace and typographic layout), and attempts to
mark that structure explicitly using HTML.

The purpose for this tool is to provide an easier way of converting existing
text documents to HTML format, giving something nicer than just whapping the
text into a big PRE block. txt2html can also be used to aid in writing new
HTML documents, but there are probably better ways of doing that.


------------------------
3. WHAT IS TXT2HTML NOT?
------------------------

txt2html is not a program to convert wordprocessor files or other marked-up
document formats. It is also not a program to convert HTML to text. Most HTML
browsers do that.

If you need to convert something other than plain text to HTML, or you need to
convert from HTML, you should look for a more appropriate tool.

txt2html is not a program for automatically generating a table-of-contents from
a file. If you want that, then use txt2html to generate a HTML file, and then
use htmltoc or hypertoc on the HTML file.


-------------------------
4. HOW TO INSTALL AND USE
-------------------------

Please, read the README.txt2html file and generated manpages txt2html(1) and
HTML::TextToHTML(3).
