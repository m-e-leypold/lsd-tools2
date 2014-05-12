
#include "demoq_int.h"
#include "demoq_float.h"     
#include <stdio.h>


int main ( int argc, char** argv ){
  
  intq   iq;
  floatq fq;

  int j;

  intq_init   ( &iq );
  floatq_init ( &fq );

  for (j = 1; j<=intq_MAXLEN; j++ ){  
    intq_put(   &iq, j );
  }

  while (intq_len(&iq)>0){
    floatq_put(   &fq, intq_get(&iq)*1.1 );
  }

  while (floatq_len(&fq)>0){
    printf("floatq - %f\n", floatq_get( &fq ) );
  }
  
  return 0;
}
