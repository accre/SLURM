from hoomd_script import *
# create 100 random particles of name A
init.create_random(N=1000000, phi_p=0.01, name='A')
# specify Lennard-Jones interactions between particle pairs
lj = pair.lj(r_cut=3.0)
lj.pair_coeff.set('A', 'A', epsilon=1.0, sigma=1.0)
# integrate at constant temperature
all = group.all();
integrate.mode_standard(dt=0.005)
integrate.nvt(group=all, T=1.2, tau=0.5)
# run 10,000 time steps
run(100e4)
