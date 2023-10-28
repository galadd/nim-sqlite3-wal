# Generated @ 2023-10-28T19:22:33+01:00
# Command line:
#   /home/gbolahan/.nimble/pkgs2/nimterop-0.6.13-a93246b2ad5531db11e51de7b2d188c42d95576a/nimterop/toast --preprocess -m:c -H --compile+=/home/gbolahan/nim-sqlite3-wal/sqlite3_abi/sqlite3.c --pnim --symOverride=sqlite3_index_info,sqlite3_vmprintf,sqlite3_vsnprintf,sqlite3_str_vappendf,sqlite_int64,sqlite_uint64,sqlite3_int64,sqlite3_uint64,SQLITE_STATIC,sqlite3_version --nim:/home/gbolahan/.choosenim/toolchains/nim-2.0.0/bin/nim --pluginSourcePath=/home/gbolahan/.cache/nim/nimterop/cPlugins/nimterop_2309319294.nim /home/gbolahan/nim-sqlite3-wal/sqlite3_abi/wal.h -o /home/gbolahan/nim-sqlite3-wal/sqlite3_abi/wal_gen.nim

{.push hint[ConvFromXtoItselfNotNeeded]: off.}


{.experimental: "codeReordering".}
{.compile: "/home/gbolahan/nim-sqlite3-wal/sqlite3_abi/sqlite3.c".}
const
  WAL_SAVEPOINT_NDATA* = 4
type
  sqlite3_index_info* {.importc, bycopy, incompleteStruct.} = object
  sqlite3_vfs* {.bycopy.} = object
    iVersion*: cint          ## ```
                             ##   Structure version number (currently 3)
                             ## ```
    szOsFile*: cint          ## ```
                             ##   Size of subclassed sqlite3_file
                             ## ```
    mxPathname*: cint        ## ```
                             ##   Maximum file pathname length
                             ## ```
    pNext*: ptr sqlite3_vfs  ## ```
                             ##   Next registered VFS
                             ## ```
    zName*: cstring          ## ```
                             ##   Name of this virtual file system
                             ## ```
    pAppData*: pointer       ## ```
                             ##   Pointer to application-specific data
                             ## ```
    xOpen*: proc (a1: ptr sqlite3_vfs; zName: sqlite3_filename;
                  a3: ptr sqlite3_file; flags: cint; pOutFlags: ptr cint): cint {.
        cdecl.}              ## ```
                             ##   Pointer to application-specific data
                             ## ```
    xDelete*: proc (a1: ptr sqlite3_vfs; zName: cstring; syncDir: cint): cint {.
        cdecl.}
    xAccess*: proc (a1: ptr sqlite3_vfs; zName: cstring; flags: cint;
                    pResOut: ptr cint): cint {.cdecl.}
    xFullPathname*: proc (a1: ptr sqlite3_vfs; zName: cstring; nOut: cint;
                          zOut: cstring): cint {.cdecl.}
    xDlOpen*: proc (a1: ptr sqlite3_vfs; zFilename: cstring): pointer {.cdecl.}
    xDlError*: proc (a1: ptr sqlite3_vfs; nByte: cint; zErrMsg: cstring) {.cdecl.}
    xDlSym*: proc (a1: ptr sqlite3_vfs; a2: pointer; zSymbol: cstring) {.cdecl.}
    xDlClose*: proc (a1: ptr sqlite3_vfs; a2: pointer) {.cdecl.}
    xRandomness*: proc (a1: ptr sqlite3_vfs; nByte: cint; zOut: cstring): cint {.
        cdecl.}
    xSleep*: proc (a1: ptr sqlite3_vfs; microseconds: cint): cint {.cdecl.}
    xCurrentTime*: proc (a1: ptr sqlite3_vfs; a2: ptr cdouble): cint {.cdecl.}
    xGetLastError*: proc (a1: ptr sqlite3_vfs; a2: cint; a3: cstring): cint {.
        cdecl.} ## ```
                ##   * The methods above are in version 1 of the sqlite_vfs object
                ##    * definition.  Those that follow are added in version 2 or later
                ## ```
    xCurrentTimeInt64*: proc (a1: ptr sqlite3_vfs; a2: ptr int64): cint {.cdecl.} ## ```
                                                                                  ##   * The methods above are in version 1 of the sqlite_vfs object
                                                                                  ##    * definition.  Those that follow are added in version 2 or later
                                                                                  ## ```
    xSetSystemCall*: proc (a1: ptr sqlite3_vfs; zName: cstring;
                           a3: sqlite3_syscall_ptr): cint {.cdecl.} ## ```
                                                                    ##   * The methods above are in versions 1 and 2 of the sqlite_vfs object.
                                                                    ##    * Those below are for version 3 and greater.
                                                                    ## ```
    xGetSystemCall*: proc (a1: ptr sqlite3_vfs; zName: cstring): sqlite3_syscall_ptr {.
        cdecl.}
    xNextSystemCall*: proc (a1: ptr sqlite3_vfs; zName: cstring): cstring {.
        cdecl.} ## ```
                ##   * The methods above are in versions 1 through 3 of the sqlite_vfs object.
                ##    * New fields may be appended in future versions.  The iVersion
                ##    * value will increment whenever this happens.
                ## ```
  
  sqlite3_syscall_ptr* = proc () {.cdecl.}
  sqlite3_filename* = cstring ## ```
                              ##   * CAPI3REF: File Name
                              ##  *
                              ##  * Type [sqlite3_filename] is used by SQLite to pass filenames to the
                              ##  * xOpen method of a [VFS]. It may be cast to (const char*) and treated
                              ##  * as a normal, nul-terminated, UTF-8 buffer containing the filename, but
                              ##  * may also be passed to special APIs such as:
                              ##  *
                              ##  * <ul>
                              ##  * <li>  sqlite3_filename_database()
                              ##  * <li>  sqlite3_filename_journal()
                              ##  * <li>  sqlite3_filename_wal()
                              ##  * <li>  sqlite3_uri_parameter()
                              ##  * <li>  sqlite3_uri_boolean()
                              ##  * <li>  sqlite3_uri_int64()
                              ##  * <li>  sqlite3_uri_key()
                              ##  * </ul>
                              ## ```
  sqlite3_file* {.bycopy.} = object
    pMethods*: ptr sqlite3_io_methods ## ```
                                      ##   Methods for an open file
                                      ## ```
  
  sqlite3_io_methods* {.bycopy.} = object
    iVersion*: cint
    xClose*: proc (a1: ptr sqlite3_file): cint {.cdecl.}
    xRead*: proc (a1: ptr sqlite3_file; a2: pointer; iAmt: cint; iOfst: int64): cint {.
        cdecl.}
    xWrite*: proc (a1: ptr sqlite3_file; a2: pointer; iAmt: cint; iOfst: int64): cint {.
        cdecl.}
    xTruncate*: proc (a1: ptr sqlite3_file; size: int64): cint {.cdecl.}
    xSync*: proc (a1: ptr sqlite3_file; flags: cint): cint {.cdecl.}
    xFileSize*: proc (a1: ptr sqlite3_file; pSize: ptr int64): cint {.cdecl.}
    xLock*: proc (a1: ptr sqlite3_file; a2: cint): cint {.cdecl.}
    xUnlock*: proc (a1: ptr sqlite3_file; a2: cint): cint {.cdecl.}
    xCheckReservedLock*: proc (a1: ptr sqlite3_file; pResOut: ptr cint): cint {.
        cdecl.}
    xFileControl*: proc (a1: ptr sqlite3_file; op: cint; pArg: pointer): cint {.
        cdecl.}
    xSectorSize*: proc (a1: ptr sqlite3_file): cint {.cdecl.}
    xDeviceCharacteristics*: proc (a1: ptr sqlite3_file): cint {.cdecl.} ## ```
                                                                         ##   Methods above are valid for version 1
                                                                         ## ```
    xShmMap*: proc (a1: ptr sqlite3_file; iPg: cint; pgsz: cint; a4: cint;
                    a5: ptr pointer): cint {.cdecl.} ## ```
                                                     ##   Methods above are valid for version 1
                                                     ## ```
    xShmLock*: proc (a1: ptr sqlite3_file; offset: cint; n: cint; flags: cint): cint {.
        cdecl.}
    xShmBarrier*: proc (a1: ptr sqlite3_file) {.cdecl.}
    xShmUnmap*: proc (a1: ptr sqlite3_file; deleteFlag: cint): cint {.cdecl.} ## ```
                                                                              ##   Methods above are valid for version 2
                                                                              ## ```
    xFetch*: proc (a1: ptr sqlite3_file; iOfst: int64; iAmt: cint;
                   pp: ptr pointer): cint {.cdecl.} ## ```
                                                    ##   Methods above are valid for version 2
                                                    ## ```
    xUnfetch*: proc (a1: ptr sqlite3_file; iOfst: int64; p: pointer): cint {.
        cdecl.} ## ```
                ##   Methods above are valid for version 3 
                ##      Additional methods may be added in future releases
                ## ```
  
  i64* = int64               ## ```
                             ##   8-byte signed integer
                             ## ```
  u8* = cuchar               ## ```
                             ##   1-byte unsigned integer
                             ## ```
  u32* = cuint ## ```
               ##   4-byte unsigned integer 
               ##     
               ##  * The type used to represent a page number.  The first page in a file
               ##  * is called page 1.  0 is used to represent "not a page".
               ## ```
  Pgno* = u32 ## ```
              ##   4-byte unsigned integer 
              ##     
              ##  * The type used to represent a page number.  The first page in a file
              ##  * is called page 1.  0 is used to represent "not a page".
              ## ```
  PgHdr* {.incompleteStruct.} = object
  sqlite3* {.incompleteStruct.} = object
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
