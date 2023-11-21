cflags {
  '-Wall', '-Wno-pointer-sign', '-Wno-maybe-uninitialized', '-Wno-attributes',
  '-I $dir',
  '-I $srcdir/include',
  '-I $outdir/include',
  '-fPIC',
  '-D MI_MALLOC_OVERRIDE',
  '-D MI_BUILD_STATIC',
  -- '-D MI_IN_ALLOC_C',

}
pkg.hdrs = {
  copy('$outdir/include/mimalloc', '$srcdir/include', {'mimalloc.h'}),
  copy('$outdir/include/mimalloc/mimalloc', '$srcdir/include/mimalloc', {'atomic.h', 'internal.h','prim.h','track.h','types.h'}),
}

lib('libmimalloc.a', [[
  src/(
    alloc.c alloc-aligned.c alloc-posix.c 
    arena.c bitmap.c heap.c init.c
    options.c os.c page.c random.c
    segment.c segment-map.c stats.c
    prim/prim.c
  )
]])
file('lib/libmimalloc.a', '644', '$outdir/libmimalloc.a')

fetch 'git'
