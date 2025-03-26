HS=cabal

all: 
	@echo "Build rfetch..."
	@$(HS) build 

clean:
	@echo "Clean..."
	@$(HS) clean

run: 
	@echo "Run rfetch..."
	@$(HS) run

rebuild:
	@make clean
	@make 
