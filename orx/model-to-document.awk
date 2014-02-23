#!/usr/bin/awk -f

# TODO: Replace A ---|> B in CLASS Headings by appropriate isA clause
# (after Heading): \INHERITANCE: {A} \ISA {B}. Or so (make it easy
# now, readability of intermediate format is not prime concern

# TODO: Respect class sublevels: Inline TODOs there to \TODO asdasdasd usw. RFDD etc should actually be TODO keywords.

# NOTE: Regarding tree editing, this tool is already at it's
# limits. Actually it becomes more and more imperative to write a
# parser builds and a formatter that traverses a tree.

# - strip 1 level of stars
# - replace class sub elements by ':' (effectively inline them)
# - remove headings of '...'
# - edit '-- <<****>>' headings 
# - replace tags by stereotypes (actually that is too strict in general, but works here)
# - remove CLASS keyword
# - drop first level heading 
# - In members, normalize whitespace, [in] and insert additiona ws befor stereotypes
# - In associations insert additional whitespace in '-> :' 


/^#\+mdldoc:/{             # This activated additional header options
    gsub(/^#\+mdldoc:/,"#+"); 
    print $0; next
}

/^[^*]/ { print; next; }  # for the rest: we're modifying only headings

/^$/    { print; next; }

/^[*][^*]/{               # we're dropping all first level headings
    L1_COUNT++              
    if ((!PREAMBLE_INSERTED) && ((L1_COUNT==2)||($2=="MODEL"))) {
        system("cat " LATEX_HEADER_FILE)
        print ""
        PREAMBLE_INSERTED=1
    }
    next; 
}             


/^[*][*]* *[.][.]* *$/{next}       # remove headings with only '...'

{
   gsub(/^[*]/,"");       # remove 1 level of stars
      
   gsub(/[ ][ ]*/," ");   # remove additional white space
   gsub(/[ ]*$/,"");
   gsub(/^[ ]*/,"");

   # print "$0: "   $0
   have_tags = match($0, /[:][a-zA-Z_0-9@:]*[:]$/ )>0;     # tags to stereotypes
   if (have_tags){
       # print RSTART, RLENGTH
       tags = "«" substr($0, RSTART+1, RLENGTH-2) "»"
       gsub(/[:]/,"» «", tags)
       gsub(/__*/," ", tags)
       $0   = substr($0, 0, RSTART-1) "  " tags
       # print "tags: " tags
       # print "$0: "   $0
   }  
}

/^[*][*]*  *CLASS  */{                                   # that's all for classes
    $0 = gensub(/^([*][*]*)  *CLASS  */, "\\1 ", "G");   
    gsub(/ *---*[|][>] */," \\isA{} ")
    print $0; next
}


function inline_as_verbatim(){

    gsub(/^[*]*/, ":");  # inline as "verbatim"
    gsub(/\\_/,"_")
    print $0;
}

/--->/{                  # Association: 

    inline_as_verbatim(); next

    # gsub(/^[*]*/, ":");  # inline as "verbatim"
    # print $0; next
}

/[a-zA-Z0-9_@] *[(].*[)]/{ # Operation
    
    gsub(/ *\[in\] */," ");                            # remove default qualifiers
    $0 = gensub(/\[([^\]\[]+)\]/, "\\1", "G");    # remove [] from the others (redundant)
     
    inline_as_verbatim(); next

    # gsub(/^[*]*/, ":");                           # inline as "verbatim"
    # print $0; next
}

/[ ][:][a-zA-Z0-9_@]/{ # Attribute

    inline_as_verbatim(); next

    # gsub(/^[*]*/, ":");    # inline as "verbatim"
    # print $0; next
}

/[*][*]* *[\\]/{ # One of the special headings used to hide/structure stuff
                 # these are really diffult to explain and mostly hackish

    gsub(/^[*]* */, "");  # inline as TeX
    print "\n" $0; next
}

{   # must be just a heading -- don't inline this
    print $0
}





