%_tidy.html: %.htm
	-tidy -asxml -clean -o $@ $<
	sed -i 's@name="#\([^"]\+\)"@name="\1"@g' $@

%.epub: %_tidy.html
	ebook-convert $< $@ --chapter "//h:span[@class='chapterno']" --extra-css extra.css
