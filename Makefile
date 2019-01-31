

subdirs = 8.2.0

LATEST=8.2.0

.PHONY: $(subdirs)

all: $(subdirs)
build: $(subdirs)
test: $(subdirs)
clean: $(subdirs)

$(subdirs):
	$(MAKE) -C $@  $(MAKECMDGOALS) LATEST=$(LATEST)
	

