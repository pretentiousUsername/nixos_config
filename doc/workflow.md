# Workflow
Basically all you need to use the workflow is the `rebuild-system` file that you
can see in the top-level directory. If you want to rebuild the system, just type
in `./rebuild system`. Since this repository uses flakes instead of channels
now, you do not need to use the `-u` flag I implemented.

You can clean up the operating system and get rid of redundant/unnecessary
packages by running `./rebuild-system -d`. This does not do any optimizations,
but it gets rid of OS version older than a week old and deletes unused packages.
If you want to optimize the system—that is, replace redundant packages with
hardlinks—you should run `./rebuild-system -o`.
