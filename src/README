
==== NAME ====

HTML::TextToHTML - convert plain text file to HTML.


==== VERSION ====

This describes version ``2.50'' of HTML::TextToHTML.


==== DESCRIPTION ====

HTML::TextToHTML converts plain text files to HTML. The txt2html script uses
this module to do the same from the command-line.

It supports headings, tables, lists, simple character markup, and
hyperlinking, and is highly customizable. It recognizes some of the apparent
structure of the source document (mostly whitespace and typographic layout),
and attempts to mark that structure explicitly using HTML. The purpose for
this tool is to provide an easier way of converting existing text documents
to HTML format, giving something nicer than just whapping the text into a
big PRE block.


==   History   ==

The original txt2html script was written by Seth Golub (see
http://www.aigeek.com/txt2html/), and converted to a perl module by Kathryn
Andersen (see http://www.katspace.com/tools/text_to_html/) and made into a
sourceforge project by Sun Tong (see
http://sourceforge.net/projects/txt2html/). Earlier versions of the
HTML::TextToHTML module called the included script texthyper so as not to
clash with the original txt2html script, but now the projects have all been
merged.


==== REQUIRES ====

HTML::TextToHTML requires Perl 5.8.1 or later.

For installation, it needs:

    Module::Build

The txt2html script needs:

    Getopt::Long
    Getopt::ArgvFile
    Pod::Usage
    File::Basename

For testing, it also needs:

    Test::More

For debugging, it also needs:

    YAML::Syck


==== INSTALLATION ====

Make sure you have the dependencies installed first! (see REQUIRES above)

Some of those modules come standard with more recent versions of perl, but I
thought I'd mention them anyway, just in case you may not have them.

If you don't know how to install these, try using the CPAN module, an easy
way of auto-installing modules from the Comprehensive Perl Archive Network,
where the above modules reside. Do "perldoc perlmodinstall" or "perldoc
CPAN" for more information.

To install this module type the following:

   perl Build.PL
   ./Build
   ./Build test
   ./Build install

Or, if you're on a platform (like DOS or Windows) that doesn't like the "./"
notation, you can do this:

   perl Build.PL
   perl Build
   perl Build test
   perl Build install

In order to install somewhere other than the default, such as in a directory
under your home directory, like "/home/fred/perl" go

   perl Build.PL --install_base /home/fred/perl

as the first step instead.

This will install the files underneath /home/fred/perl.

You will then need to make sure that you alter the PERL5LIB variable to find
the modules, and the PATH variable to find the script.

Therefore you will need to change: your path, to include
/home/fred/perl/script (where the script will be)

        PATH=/home/fred/perl/script:${PATH}

the PERL5LIB variable to add /home/fred/perl/lib

        PERL5LIB=/home/fred/perl/lib:${PERL5LIB}

Note that the system links dictionary will be installed as
"/home/fred/perl/share/txt2html/txt2html.dict"

If you want to install in a temporary install directory (such as if you are
building a package) then instead of going

   perl Build install

go

   perl Build install destdir=/my/temp/dir

and it will be installed there, with a directory structure under
/my/temp/dir the same as it would be if it were installed plain. Note that
this is NOT the same as setting --install_base, because certain things are
done at build-time which use the install_base info.

See "perldoc perlrun" for more information on PERL5LIB, and see "perldoc
Module::Build" for more information on installation options.


==== AUTHOR ====

    Kathryn Andersen (RUBYKAT)
    perlkat AT katspace dot com
    http//www.katspace.com/

based on txt2html by Seth Golub


==== COPYRIGHT AND LICENCE ====

Original txt2html script copyright (c) 1994-2000 Seth Golub <seth AT
aigeek.com>

Copyright (c) 2002-2005 by Kathryn Andersen

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

