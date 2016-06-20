OBJECTS_DIR= obj
REALMAKEFILE=../src/Makefile.in
TOOLMAKEFILE=../tools/Makefile.in

all: tools solver

solver: FORCE
	@(cd $(OBJECTS_DIR) && $(MAKE) -f $(REALMAKEFILE) --no-print-directory)

tools: #FORCE
	$(MAKE) -C tools

clean: FORCE
	@(cd $(OBJECTS_DIR) && $(MAKE) -f $(REALMAKEFILE) clean --no-print-directory)
	@rm -rf obj bin *~
	@$(MAKE) -C tools clean --no-print-directory
	@$(MAKE) -C test clean --no-print-directory
	
FORCE:
	@mkdir -p obj bin

test:
	@$(MAKE) -C test --no-print-directorys

dep:
	@(cd src && ../tools/bin/make_dependencies .)
.PHONY: tools clean test FORCE dep all
