packageName   = "sqlite3_wal"
version       = "3.40.1.1"
author        = "Status Research & Development GmbH"
description   = "A wrapper for SQLite"
license       = "Apache License 2.0 or MIT"
installFiles  = @["sqlite3_abi.nim", "sqlite3_abi/wal_gen.nim", "sqlite3_abi/sqlite3.c", "sqlite3_abi/sqlite3.h", "sqlite3_abi/wal.h"]

### Dependencies
requires "nim >= 0.18.1"
