all:
	ghc  -rtsopts -threaded groupstreets.hs
	ghc -rtsopts -threaded makedico.hs

run:
	./sortrue +RTS -N4 -M10G

clean:
	rm *.hi
	rm *.o
	rm groupstreets
	rm makedico
