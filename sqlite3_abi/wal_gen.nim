# Generated @ 2023-10-27T00:17:01+01:00
# Command line:
#   /home/gbolahan/.nimble/pkgs2/nimterop-0.6.13-a93246b2ad5531db11e51de7b2d188c42d95576a/nimterop/toast --preprocess -m:c -H --compile+=/home/gbolahan/nim-sqlite3-wal/sqlite3_abi/sqlite3.c --pnim --symOverride=sqlite3_index_info,sqlite3_vmprintf,sqlite3_vsnprintf,sqlite3_str_vappendf,sqlite_int64,sqlite_uint64,sqlite3_int64,sqlite3_uint64,SQLITE_STATIC,sqlite3_version --nim:/home/gbolahan/.choosenim/toolchains/nim-2.0.0/bin/nim --pluginSourcePath=/home/gbolahan/.cache/nim/nimterop/cPlugins/nimterop_2309319294.nim /home/gbolahan/nim-sqlite3-wal/sqlite3_abi/wal.h -o /home/gbolahan/nim-sqlite3-wal/sqlite3_abi/wal_gen.nim

{.push hint[ConvFromXtoItselfNotNeeded]: off.}


{.experimental: "codeReordering".}
{.compile: "/home/gbolahan/nim-sqlite3-wal/sqlite3_abi/sqlite3.c".}
const
  WAL_SAVEPOINT_NDATA* = 4
type
  sqlite3_index_info* {.importc, bycopy, incompleteStruct.} = object
  Wal* {.incompleteStruct.} = object
proc sqlite3WalOpen*(a1: ptr sqlite3_vfs; a2: ptr sqlite3_file; a3: cstring;
                     a4: cint; a5: i64; a6: ptr ptr Wal): cint {.importc, cdecl.}
  ## ```
                                                                                 ##   Open and close a connection to a write-ahead log.
                                                                                 ## ```
proc sqlite3WalClose*(pWal: ptr Wal; a2: ptr sqlite3; sync_flags: cint;
                      a4: cint; a5: ptr u8): cint {.importc, cdecl.}
proc sqlite3WalLimit*(a1: ptr Wal; a2: i64) {.importc, cdecl.}
  ## ```
                                                              ##   Set the limiting size of a WAL file.
                                                              ## ```
proc sqlite3WalBeginReadTransaction*(pWal: ptr Wal; a2: ptr cint): cint {.
    importc, cdecl.}
  ## ```
                    ##   Used by readers to open (lock) and close (unlock) a snapshot.  A
                    ##  * snapshot is like a read-transaction.  It is the state of the database
                    ##  * at an instant in time.  sqlite3WalOpenSnapshot gets a read lock and
                    ##  * preserves the current state even if the other threads or processes
                    ##  * write to or checkpoint the WAL.  sqlite3WalCloseSnapshot() closes the
                    ##  * transaction and releases the lock.
                    ## ```
proc sqlite3WalEndReadTransaction*(pWal: ptr Wal) {.importc, cdecl.}
proc sqlite3WalFindFrame*(a1: ptr Wal; a2: Pgno; a3: ptr u32): cint {.importc,
    cdecl.}
  ## ```
           ##   Read a page from the write-ahead log, if it is present.
           ## ```
proc sqlite3WalReadFrame*(a1: ptr Wal; a2: u32; a3: cint; a4: ptr u8): cint {.
    importc, cdecl.}
proc sqlite3WalDbsize*(pWal: ptr Wal): Pgno {.importc, cdecl.}
  ## ```
                                                              ##   If the WAL is not empty, return the size of the database.
                                                              ## ```
proc sqlite3WalBeginWriteTransaction*(pWal: ptr Wal): cint {.importc, cdecl.}
  ## ```
                                                                             ##   Obtain or release the WRITER lock.
                                                                             ## ```
proc sqlite3WalEndWriteTransaction*(pWal: ptr Wal): cint {.importc, cdecl.}
proc sqlite3WalUndo*(pWal: ptr Wal;
                     xUndo: proc (a1: pointer; a2: Pgno): cint {.cdecl.};
                     pUndoCtx: pointer): cint {.importc, cdecl.}
  ## ```
                                                                ##   Undo any frames written (but not committed) to the log
                                                                ## ```
proc sqlite3WalSavepoint*(pWal: ptr Wal; aWalData: ptr u32) {.importc, cdecl.}
  ## ```
                                                                              ##   Return an integer that records the current (uncommitted) write
                                                                              ##  * position in the WAL
                                                                              ## ```
proc sqlite3WalSavepointUndo*(pWal: ptr Wal; aWalData: ptr u32): cint {.importc,
    cdecl.}
  ## ```
           ##   Move the write position of the WAL back to iFrame.  Called in
           ##  * response to a ROLLBACK TO command.
           ## ```
proc sqlite3WalFrames*(pWal: ptr Wal; a2: cint; a3: ptr PgHdr; a4: Pgno;
                       a5: cint; a6: cint): cint {.importc, cdecl.}
  ## ```
                                                                   ##   Write a frame or frames to the log.
                                                                   ## ```
proc sqlite3WalCheckpoint*(pWal: ptr Wal; db: ptr sqlite3; eMode: cint;
                           xBusy: proc (a1: pointer): cint {.cdecl.};
                           pBusyArg: pointer; sync_flags: cint; nBuf: cint;
                           zBuf: ptr u8; pnLog: ptr cint; pnCkpt: ptr cint): cint {.
    importc, cdecl.}
  ## ```
                    ##   Copy pages from the log to the database file
                    ## ```
proc sqlite3WalCallback*(pWal: ptr Wal): cint {.importc, cdecl.}
  ## ```
                                                                ##   Return the value to pass to a sqlite3_wal_hook callback, the
                                                                ##  * number of frames in the WAL at the point of the last commit since
                                                                ##  * sqlite3WalCallback() was called.  If no commits have occurred since
                                                                ##  * the last call, then return 0.
                                                                ## ```
proc sqlite3WalExclusiveMode*(pWal: ptr Wal; op: cint): cint {.importc, cdecl.}
  ## ```
                                                                               ##   Tell the wal layer that an EXCLUSIVE lock has been obtained (or released)
                                                                               ##  * by the pager layer on the database file.
                                                                               ## ```
proc sqlite3WalHeapMemory*(pWal: ptr Wal): cint {.importc, cdecl.}
  ## ```
                                                                  ##   Return true if the argument is non-NULL and the WAL module is using
                                                                  ##  * heap-memory for the wal-index. Otherwise, if the argument is NULL or the
                                                                  ##  * WAL module is using shared-memory, return false.
                                                                  ## ```
proc sqlite3WalFile*(pWal: ptr Wal): ptr sqlite3_file {.importc, cdecl.}
  ## ```
                                                                        ##   Return the sqlite3_file object for the WAL file
                                                                        ## ```
{.pop.}
