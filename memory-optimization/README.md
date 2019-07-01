# Memory optimization example

This job shows an example of using the `smemwatch` script to run a
watchdog process in the background while your job runs to get
more detailed information about the overall kernel control group
memory usage from all of your job's processes.

The script is invoked at the start of your job, and you must pass
it the process ID number of the running slurm script which is
accessible in bash as `$$`.

The `-d` option tells the script how many milliseconds to wait
between checks of memory usage.

The `-l` option tells the script to log each memory usage observation
to the specified file. The log will be in CSV format with a unix
timestamp followed by the total cgroup RSS memory usage in bytes.

The `-k` option can be used to automatically kill your job if it
passes a specified threshold in percent of total allowed memory.
For certain specific cases this may be preferable to the user over
letting the linux kernel out-of-memory killer choose a process
to destroy.
