all:
	ghc -rtsopts -threaded -eventlog dbf2ref.hs

run:
	./sortrue +RTS -N4 -M10G

clean:
	rm *.hi
	rm *.o
	rm sortrue
	rm makedico
