# Minimal Jekyll via Docker (foreground)
PORT := 4000

.PHONY: serve

serve:
	docker run --rm -it \
		-v "$$(pwd):/site" -w /site \
		-p $(PORT):4000 \
		ruby:3.3 \
		bash -c "gem install bundler && \
		         bundle config set path vendor/bundle && \
		         bundle install && \
		         exec bundle exec jekyll serve --host 0.0.0.0 --port 4000 --trace --future"
