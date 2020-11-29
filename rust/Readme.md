
## Cross-compiling Rust programs

```
# list the target from the platform list
rustup target list

# add the Linux target, e.g. use musl to statically link the libc library to binary
rustup target add x86_64-unknown-linux-musl

# if running in MacOS, need to install this tool
brew install FiloSottile/musl-cross/musl-cross

# need to tell Rust about the linker
# add a new file named .cargo/config in the root of your project 
# and set its content to:
[target.x86_64-unknown-linux-musl]
linker = "x86_64-linux-musl-gcc"

# add this variable to prevent link errors
export TARGET_CC=x86_64-linux-musl-gcc
```
