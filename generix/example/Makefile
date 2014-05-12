#
#   lsdtools -- miscellanous useful utilities
#
#   Copyright (C) 2006-2009  M E Leypold, Software-Dienstleistungen und Beratung
#
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   version 2 as published by the Free Software Foundation (no later
#   version).
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
#   02110-1301 USA.
#
#
#   lsdscripts/example/Makefile - Demonstration Makefile for use of lsdscripts
#                                 in a project source tree.

default: print-path all

CFLAGS = -g

export PATH   :=$(PWD)/Scripts:$(PATH)

FAIL    = { rm -f $@ || exit 1; }
GENERIX = generix

print-path:
	@echo ' PATH => '"$$PATH"


# -------------------------------------------------

all::    demoq
demoq:   demoq.o demoq_int.o demoq_float.o  fifo.o libpanic.o

include  demoq_int.M_mk demoq_float.M_mk

demoq.o:       	demoq_int.h demoq_float.h
demoq_int.o: 	demoq_int.h
demoq_float.o: 	demoq_float.h

%.M_mk: %.M
	$(GENERIX) print-dependencies -I . -o "$*" "$<" > "$@" || $(FAIL)

GENERIX-INSTANTIATE   = $(GENERIX) instantiate -I . -o "$(INSTANCE)" "$<"

clean::
	rm -f demoq_*.M_* demoq_*.c demoq_*.h demoq *.o









