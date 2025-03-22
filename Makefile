all: 
	cabal build >> /dev/null

clean:
	cabal clean

run: 
	cabal run
