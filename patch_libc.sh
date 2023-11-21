#!/bin/sh
LIBC_PATH=$(find out/pkg/musl -name libc.a)
MIMALLOC_PATH=$(find out/pkg/mimalloc -name libmimalloc.a)

{
    echo "CREATE libc.a"
    echo "ADDLIB $LIBC_PATH"
    echo "DELETE aligned_alloc.c.o calloc.c.o donate.c.o free.c.o libc_calloc.c.o lite_malloc.c.o malloc.c.o malloc_usable_size.c.o memalign.c.o posix_memalign.c.o realloc.c.o reallocarray.c.o valloc.c.o"
    echo "ADDLIB $MIMALLOC_PATH"
    echo "SAVE"
} | ar -M

mv libc.a $LIBC_PATH
