# install the site
DEST_DIR=/home/groups/t/tx/txt2html

.PHONY: install
install:
	rsync -v --cvs-exclude --progress --archive -v --rsh="ssh -l rubykat" \
	htdocs/ txt2html.sourceforge.net:$(DEST_DIR)/htdocs/
	rsync -v --cvs-exclude --progress --archive -v --rsh="ssh -l rubykat" \
	cgi-bin/ txt2html.sourceforge.net:$(DEST_DIR)/cgi-bin/


