.PHONY: clean check format
clean:
	rm *.bak
format:
	# to implement.
check:
	carton exec prove -Ilib	