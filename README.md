# tasty-reporter-muffled

A console reporter using almost all of the conventions of `tasty`'s standard reporter, with the following exceptions:

- In the case where a test fails, it will not print the "use -p ... to re-run the test" line.
- In the case where an error is printed, the test will automatically strip the call stack.

### What is the purpose?

When students are first learning to code, they tend to be dealing with small amounts of code which is all colocated; and moreover any errors are likely to derive directly from that code.

This reporter hides the callstack and reduces additional noise in order to make test errors easier to parse and understand at a glance.
