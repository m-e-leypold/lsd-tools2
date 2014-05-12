#ifndef H_INCLUDED_fifo
#define H_INCLUDED_fifo

#include <sys/types.h>


typedef struct fifo {
  
  void* write_p;
  void* read_p;

  char buffer[1]; /* hm ... */

} fifo ;


typedef struct fifo_DESCRIPTOR {
  size_t maxindex;
  size_t element_size;

} fifo_DESCRIPTOR;

void fifo_init( fifo_DESCRIPTOR* inst, fifo* f );
void fifo_get ( fifo_DESCRIPTOR* inst, fifo* , void* var );
void fifo_put ( fifo_DESCRIPTOR* inst, fifo* , void* var );
int  fifo_len ( fifo_DESCRIPTOR* inst, fifo* f );
#endif
