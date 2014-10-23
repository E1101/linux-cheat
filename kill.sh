# POSIX 7

# On Ubuntu 12.04, implemented by the procps package.

# Kill exists as a bash built-in.
# One of the reasons for this is to allow users to `kill` by jobspec for example as `sleep 1- &; kill %1`,
# Which an external executable could not do. Killin gby PID is required by POSIX 7.

# Send signals to a process. Signals are an ANSI C concept, with POSIX and Linux extensions.

# Does not necessarily send SIGKILL, nor is SIGKILL the default signal sent!
# The default signal it sends is SIGTERM.

# It is unfortunatelly named kill because most signals end up killing process,
# or also because the most used signal is SIGTERM generated by a C-C on the terminal.
# which has the usual effect of killing a process.

# List all signals available on the system:

  kill -l

# Lists numbers and descriptions.

# Send SIGTERM signal to process:

  ps -A
  ID=
  kill $ID

# SIGTERM is the default signal sent by `kill`.

# Select by pid, found on ps for example.

# Select by job-id found on jobs:

  sleep 10 &
  jobs
  kill %1

# POSIX specifies this.

# Send stop signal to process:

  kill -s SIGSTOP $ID
  kill -s sigstop $ID
  kill -s STOP $ID
  kill -s stop $ID

# All of the above are specified by POSIX.

# Where `SIGSTOP` is the standard signal name.

# Also possible with the XSI extension:

  kill -SIGSTOP $ID
  kill -sigstop $ID
  kill -STOP $ID
  kill -stop $ID

# But not recommended because it is less uniform parameter passing,
# and not guaranteed to be on all implementations.