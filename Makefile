SASS=sassc
SASS_OPTS=--style compressed --sourcemap

all: static/css/main.min.css

static/css/main.min.css: static/css/main.scss
	$(SASS) $(SASS_OPTS) $< $@
