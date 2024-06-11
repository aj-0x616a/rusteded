#!/bin/sh

# Setup CI release with cargo dist - https://opensource.axo.dev/cargo-dist/book/ci/github.html

rustup update


git clone git@github.com:aj-0x616a/rusteded.git
cd rusteded
cargo new .
cargo init
awk '/\[package\]/ {print; print "repository = \"https://github.com/aj-0x616a/rusteded\""; next}1' Cargo.toml > Cargo.toml.tmp && mv Cargo.toml.tmp Cargo.toml
cargo run

cargo install cargo-dist

cargo dist init
git add .
git commit -am "release: version 0.1.0"
git push
git tag v0.1.0

git push
git push --tags
