job-array2
-------------

This is a job array example where we have a bunch of files we want
to analyze in the same way. The files can have arbitrary names, but
must all be inside a directory called **data** without any other
files present. In this example:

    [joe@vmps55 job-array2]$ ls data/ > files
    [joe@vmps55 job-array2]$ cat files
        vectorization_A123.py  
        vectorization_B456.py  
        vectorization_bar.py  
        vectorization_foo.py  
        vectorization_W543.py
 
We use awk in the SLURM script to get a unique file name for each 
job array element, the user must only put the appropriate files in
the **data** directory and adjust the **--array=** line to the appropriate
length.   
