
Installing Julia on ACCRE
-------------------------

Note that Julia is not currently included in ACCRE package distributions. Thankfully, the pre-compiled binary for Julia appears to run smoothly on ACCRE, making installation easy (although keep any eye out for problems -- in the future, ACCRE will provide Julia compiled specifically against the ACCRE system, but for now this is not guaranteed to work without problems).

To install, go to [https://julialang.org/downloads/](https://julialang.org/downloads/) and download the 64-bit (X86) Generic Linux Binary. Load this binary onto your `/home/[vunetuserid]` directory, then add a symlink to your `/usr/local/bin` folder so ACCRE can find Julia. Directions for doing so can be found [here](https://julialang.org/downloads/platform.html#generic-linux-binaries).
