# hsfetch

all:
	@echo Building...
	@cabal build

clean:
	@echo Cleaning...
	@cabal clean

install: all 
	@echo Installing...
	@install -m755 hsfetch /usr/local/bin/hsfetch

uninstall: 
	@echo Uninstalling...
	@rm -rf /usr/local/bin/rfetch

