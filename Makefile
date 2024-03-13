.PHONY: clean check format
clean:
	rm *.bak
format:
	author/format.sh
check:
	carton exec prove -Ilib	