#
# Makefile
#
#
TARGET = pg_bsd_indent
XFLAGS = -Wall -D__RCSID="static char *rcsid=" -D__COPYRIGHT="static char *copyright="
CFLAGS = -O
LIBS = 

$(TARGET) : args.o indent.o io.o lexi.o parse.o pr_comment.o
	$(CC) -o $(TARGET) $(XFLAGS) $(CFLAGS) args.o indent.o io.o lexi.o parse.o pr_comment.o $(LIBS)

args.o	: args.c indent_globs.h
	$(CC) -c $(XFLAGS) $(CFLAGS) args.c

indent.o	: indent.c indent_globs.h indent_codes.h
	$(CC) -c $(XFLAGS) $(CFLAGS) indent.c

io.o	: io.c indent_globs.h
	$(CC) -c $(XFLAGS) $(CFLAGS) io.c

lexi.o	: lexi.c indent_globs.h indent_codes.h
	$(CC) -c $(XFLAGS) $(CFLAGS) lexi.c

parse.o	: parse.c indent_globs.h indent_codes.h
	$(CC) -c $(XFLAGS) $(CFLAGS) parse.c

pr_comment.o	: pr_comment.c indent_globs.h
	$(CC) -c $(XFLAGS) $(CFLAGS) pr_comment.c

clean:
	rm -f *.o $(TARGET) log core

distclean: clean
	rm -f tags ID

install: $(TARGET)
	install -s -o bin -g bin $(TARGET) /usr/local/bin
