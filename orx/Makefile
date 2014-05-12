
default:

clean:

MYDIR  = $(PWD)
MKDIR  = mkdir -p 
MKLINK = set -x; mklink(){ cd "$$(dirname "$$2")" &&  { if test -L "$$2"; then rm "$$2" ; fi;  ln -s "$$1" "$$2"; } ; } ; mklink 

install::
	$(MKDIR)  ~/.orx
	$(MKLINK) $(PWD) ~/.orx/orx
	$(MKDIR)  ~/.boilerplate
	$(MKLINK) $(PWD)/boilerplate ~/.boilerplate/orx

# Relative links would be better, but I don't have the tools ATM 
