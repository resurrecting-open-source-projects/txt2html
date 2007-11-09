HTM := html

OBJS = txt2html.$(HTM) \
	TextToHTML.$(HTM) \
	Changes.$(HTM) \
	README.$(HTM) \
	sample.html \
	TODO.$(HTM) \
	index.$(HTM)

all:: $(OBJS)

TEXT_TO_HTML_DIR=../../src

CPFILES= txt2html \
Changes.txt \
README.txt \
TODO.txt \
sample.txt \
TextToHTML.pm

txt2html.$(HTM): txt2html
	pod2html --infile=$< >$@

TextToHTML.$(HTM): TextToHTML.pm 
	pod2html --infile=$< >$@

Changes.$(HTM): Changes.txt page.foot
	./txt2html --titlefirst \
	--default_link_dict "" \
	--append_body page.foot --infile $< > $@

README.$(HTM): README.txt page.foot
	./txt2html --titlefirst \
	--default_link_dict "" \
	--append_body page.foot --infile $< > $@

TODO.$(HTM): TODO.txt page.foot
	./txt2html --titlefirst \
	--default_link_dict "" \
	--append_body page.foot --infile $< > $@

sample.html: sample.txt page.foot
	./txt2html \
	--titlefirst --mailmode --make_tables \
	--custom_heading_regexp '^ *--[\w\s]+-- *' \
	--default_link_dict "" \
	--append_body page.foot --infile sample.txt > $@

# the copies of the document source
.PHONY: del_cpfiles
del_cpfiles:
	rm $(CPFILES)

.PHONY: cpfiles
cpfiles: $(CPFILES)

Changes.txt:
	rm -f $@; cp $(TEXT_TO_HTML_DIR)/Changes $@

README.txt:
	rm -f $@; cp $(TEXT_TO_HTML_DIR)/README $@

TODO.txt:
	rm -f $@; cp $(TEXT_TO_HTML_DIR)/TODO $@

sample.txt:
	rm -f $@; cp $(TEXT_TO_HTML_DIR)/tfiles/sample.txt $@

TextToHTML.pm:
	rm -f $@; cp $(TEXT_TO_HTML_DIR)/lib/HTML/TextToHTML.pm $@

txt2html:
	rm -f $@; cp $(TEXT_TO_HTML_DIR)/scripts/txt2html $@; chmod u+x $@

.PHONY: clean
clean:
	rm -f *~ Changes.html README.html \
	TODO.html TextToHTML.html sample.html txt2html.html

