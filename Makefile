# hsfetch

all:
	@echo Building...
	@cabal build
	@cp ./dist-newstyle/build/x86_64-linux/ghc-9.6.7/hsfetch-1.3.0.0/x/rfetch/build/rfetch/rfetch

clean:
	@echo Cleaning...
	@cabal clean

install: all 
	@echo Installing...
	@install 755 hsfetch /usr/local/bin/ 

uninstall: 
	@echo Uninstalling...
	@rm -rf /usr/local/bin/rfetch

