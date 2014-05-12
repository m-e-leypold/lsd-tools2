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
 *   libpanic.c -- handle library panics by exiting the process.
 *
 */


#include <stdio.h>
#include <stdarg.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>


void
libpanic( int errnum, char* msgs, ... ){
  
  va_list args;
  char*   t;

  if (errnum){
    fprintf(stderr, "library panic: %s.\n", strerror(errnum));
  }

  va_start(args,msgs); t = msgs;

  if (t) {
    
    fprintf(stderr, "library panic");

    while(t){
      fprintf(stderr, ": %s", t);      
      t = va_arg(args, char*);
    }
    fprintf(stderr, ".\n");
    va_end(args);
  }

  exit(1);
}


