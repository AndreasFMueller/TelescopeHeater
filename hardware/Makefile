#
# Makefile -- make zip package to order the boards
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
FILES = 								\
	telescopeheater-B.Cu.gbr					\
	telescopeheater-B.Mask.gbr					\
	telescopeheater-Edge.Cuts.gbr					\
	telescopeheater-F.Cu.gbr					\
	telescopeheater-F.Mask.gbr					\
	telescopeheater.drl

telescopeheater.zip:	$(FILES)
	rm -f telescopeheater.zip
	zip telescopeheater.zip $(FILES)
