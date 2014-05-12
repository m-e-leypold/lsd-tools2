#ifndef H_INCLUDED_libpanic
#define H_INCLUDED_libpanic

/*
 *   libCX -- data type source library for C
 *
 *   Copyright (C) 2006,2007  M E Leypold, Software-Dienstleistungen und Beratung
 *
 *   This program is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU General Public License
 *   version 2 as published by the Free Software Foundation (no later
 *   version).
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *   General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 *   02110-1301 USA.
 *
 *   libpanic.h -- interface to libpanic runtime.
 *
 */


/* [...] 
 *
 */

#include <assert.h>

void
libpanic( int errnum, char* msgs, ... );

#define LIBPANIC( msg, errnum ) { libpanic( errnum, msg, 0 ); }

#define LIBCHECK(cond)  \
        { if (!(cond)) { libpanic( 0, "assertion failed: " #cond, 0 );}; }


#ifdef NDEBUG
#  define LIBASSERT(cond)
#else
#  define LIBASSERT(cond) \
        { if (!(cond)) { libpanic( 0, "assertion failed: " #cond, 0 );}; }
#endif

#endif
