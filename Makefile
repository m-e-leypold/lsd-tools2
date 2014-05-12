#
# LDS-Tools2: A collection of useful scripts developed by M E Leypold
# Copyright (C) 2013 -- M E Leypold

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Makefile: Build and clean from project top dir.

default:

SUBDIRS = boilerplate orx

clean:
	find . -name "*~" | xargs rm -f

MYDIR  = $(PWD)
MKDIR  = mkdir -p 
MKLINK = set -x; mklink(){ cd "$$(dirname "$$2")" &&  { if test -L "$$2"; then rm "$$2" ; fi;  ln -s "$$1" "$$2"; } ; } ; mklink 

install::
	$(MKDIR)  ~/.scripts
	$(MKLINK) $(PWD) ~/.scripts/lsd-tools2
	$(MKLINK) lsd-tools2 ~/.scripts/00-lsd-tools2

install::
	for SUBDIR in $(SUBDIRS); do ( cd "$$SUBDIR" && make install ); done

