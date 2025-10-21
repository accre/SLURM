# SLURM Epilogs (and Prologs)

Epilogs are useful for performing cleanup and post-processing after your job has completed.
They are perfect when you find yourself performing the same post-processing steps time and time 
again for a particular type of job.

Prologs are also available within SLURM, and they work in an identical manner to epilogs. 

For more details on SLURM epilogs and prologs, see: http://slurm.schedmd.com/prolog_epilog.html

## The Epilog Script

The epilog script should be executable, which you can accomplish using the command ```chmod```. For example,
to make a script called **myscript.sh** executable you can type:

	chmod +x myscript.sh

In this example, the epilog script is a Bash script, but it can be any type of executable file you want it to be
(Python, Perl, etc.).

Generally, you want to put your epilog script in a place that is easy to access and recall. Some place like 
**$HOME/epilogs** might work well. 

## Using Srun

To invoke your epilog script once your job is complete, you must pass your program to SLURM's ```srun``` command. Take
whatever command (and arguments) you typically use, and simply prepend: 

	srun --epilog=/path/to/your/epilog/myscript.sh