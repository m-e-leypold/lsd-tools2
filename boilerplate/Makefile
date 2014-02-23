
default:

clean:

MYDIR  = $(PWD)
MKDIR  = mkdir -p 
MKLINK = set -x; mklink(){ cd "$$(dirname "$$2")" &&  { if test -L "$$2"; then rm "$$2" ; fi;  ln -s "$$1" "$$2"; } ; } ; mklink 

install::
	$(MKDIR)  ~/.boilerplate
	$(MKLINK) $(PWD) ~/.boilerplate/lsd

# Relative links would be better, but I don't have the tools ATM 