#!/usr/bin/awk -f

# TODO: Per block option :annotate-lines to suppress annotation, more line directives for other languages

BEGIN{ if (!(SOURCENAME)) { SOURCENAME = FILENAME ; }; }

function emit_line_directive(){  

    if (BLOCKTYPE=="c" || BLOCKTYPE=="c++") {
	print "  #line " FNR+1 " \"" SOURCENAME "\"";
	next;
    };
}

($1=="#+begin_src"){
    BLOCKTYPE=$2;
    print;
    emit_line_directive();
    next;
}

($1=="#+end_src"){
    BLOCKTYPE="";
}

/[<][<][A-Za-z0-9_]*[>][>][ 	]*$/{
    if (BLOCKTYPE){
	print;
	emit_line_directive();
	next;
    }
}

{ print; }
