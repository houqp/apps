# App Framework

You'll need node.js version > 0.8

To install the dependencies simply run:

    make deps
    
## Compile coffeescript
To compile the coffeescript and run the unittests simply run:

    make
    
If you want to autocompile on change run:

    make watch

## Clear compiled folder
To clear the build/ folder run:

    make clean

## Run js unittests
To run js unittests with the ci server, use 

	make ci