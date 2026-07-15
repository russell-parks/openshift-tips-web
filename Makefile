PUBLIC_URL ?= https://openshift-tips.rezzell.com/
CF_PAGES_PROJECT ?= openshift-tips
CF_PAGES_BRANCH ?= integration/latest
HUGO_IMAGE ?= klakegg/hugo:0.55.6
DOCKER_PLATFORM ?= linux/amd64

.PHONY: build deploy

build:
	docker run --rm --entrypoint sh --platform $(DOCKER_PLATFORM) \
		-v "$(PWD):/src" \
		-w /src \
		$(HUGO_IMAGE) \
		-c 'hugo --gc --minify --cleanDestinationDir -b "$(PUBLIC_URL)" -d /src/public'

deploy: build
	npx wrangler pages deploy public \
		--project-name $(CF_PAGES_PROJECT) \
		--branch=$(CF_PAGES_BRANCH)
