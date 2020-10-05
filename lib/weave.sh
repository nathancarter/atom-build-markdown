#!/bin/sh

echo "Locating julia executable..."
julia=`which julia`
if [ "$julia" = "" ]; then
    echo "Could not find julia executable in path."
    exit 1
else
    echo "Found it at $julia..."
fi

echo "Locating package directory..."
pkgdir=`julia -e 'print(Pkg.dir())'`
if [ "$pkgdir" = "" ]; then
    echo "Could not find julia package directory."
    echo "Is your Julia installation functioning correctly?"
    exit 1
else
    echo "Found it at $pkgdir..."
fi

echo "Locating weave.jl script..."
weave="$pkgdir/Weave/bin/weave.jl"
if ! [ -e "$weave" ]; then
    echo "Could not find weave.jl script here:"
    echo $weave
    echo "Try running Pkg.add(\"Weave\") in Julia."
    exit 1
else
    echo "Found it at $weave..."
fi

echo "Running weave.jl on $1..."
"$julia" "$weave" "$1"
echo "Weave complete."
