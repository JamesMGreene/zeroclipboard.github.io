VERSION = 2.2.0
PORT = 3000

all: \
	gem \
	serve \

gem:
	bundle install

update:
	curl -L -o javascripts/zc/v$(VERSION)/ZeroClipboard.js https://raw.github.com/zeroclipboard/zeroclipboard/v$(VERSION)/dist/ZeroClipboard.js
	curl -L -o javascripts/zc/v$(VERSION)/ZeroClipboard.swf https://raw.github.com/zeroclipboard/zeroclipboard/v$(VERSION)/dist/ZeroClipboard.swf
	@echo "Downloaded v$(VERSION) of the ZeroClipboard JS and SWF files."
	@echo "IMPORTANT: You must update the \"index*.html\" file(s) to enable selecting new versions!"

commit: update
	git add .
	git commit -a -m "Update demo files to latest changes."
	git push

browse:
	open "http://localhost:$(PORT)/"

server:
	bundle exec jekyll serve --port $(PORT)

serve: update browse server

.PHONY: all gem update commit browse server serve
