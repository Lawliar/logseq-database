## ASAN does not call __asan_init properly

from alejandro, he has to call __asan_init manually due to some reason not clearly explained here: https://github.com/google/sanitizers/wiki/AddressSanitizerAsDso. Might look into it later.
