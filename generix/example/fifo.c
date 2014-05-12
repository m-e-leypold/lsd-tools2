
#include "fifo.h"
#include "libpanic.h"
#include <string.h>

static void 
_inc_ptr( fifo_DESCRIPTOR* inst, void** p, fifo* f)
{

  char* q;
  char* b;

  b = f->buffer; q = *p;

  if (q == b + (inst->maxindex) * inst->element_size ) 
    { *p = b; } 
  else                           
    { *p = q + inst->element_size; };
}


void
fifo_init ( fifo_DESCRIPTOR* inst, fifo* f )
{
  f->write_p = f->buffer;
  f->read_p  = f->buffer;
}



void
fifo_get ( fifo_DESCRIPTOR* inst, fifo* f, void* var)
{
  void* p;

  if (f->read_p == f->write_p) LIBPANIC("fifo: fifo empty", 0);
  p = f->read_p;

  _inc_ptr(inst, &(f->read_p), f);

  memcpy(var, p, inst->element_size);
}

int
fifo_len       ( fifo_DESCRIPTOR* inst, fifo* f ) 
{

  int len;

  if (f->write_p >= f->read_p) return ((char*)f->write_p - (char*)f->read_p) / inst->element_size;
  else return inst->maxindex+1 - ((char*)f->read_p - (char*)f->write_p) / inst->element_size;

  return len;
}

void
fifo_put       ( fifo_DESCRIPTOR* inst, fifo* f, void* var )
{
  void* p;

  p = f->write_p;
  _inc_ptr(inst, &p, f);

  if ( p == f->read_p ) LIBPANIC("fifo: fifo full", 0);

  memcpy(f->write_p, var, inst->element_size);

  f->write_p = p;
}
