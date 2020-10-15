CC=gcc

TARGET=md5_test
LIB_TARGET=md5

INCPATH   = ./
SRCPATH   = ./
OBJPATH   = ./

CFLAGS+= -I$(INCPATH)

CFLAGS+= -DLINUX=1

CFLAGS+= -O2

W = -Wall -Wno-unused-variable
CFLAGS += $(W)


SRCS = md5_test.c
LIB_SRCS = md5.c

SRC_OBJ = $(patsubst %.c, $(SRCPATH)%.o,$(LIB_SRCS))

%.o: %.c
	$(CC)  -c -o $@ $(patsubst %.o, %.c,$@)  $(CFLAGS)

main:md5lib

md5lib: 
	$(CC) -fPIC -shared -o lib$(LIB_TARGET).so $(LIB_SRCS) $(CFLAGS)

test:	
	$(CC) -o $(TARGET) $(SRCS) $(CFLAGS) -L./ -l$(LIB_TARGET)
