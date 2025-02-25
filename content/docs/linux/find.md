---
title: "find"
date: 2025-02-25
tags: ["linux", "find"]
---

# find

## Search by name
~~~shell
find . -name "s.txt"
~~~

### case-insensitive
~~~shell
find . -iname "s.txt"
~~~

### use the *.png wildcard template
~~~shell
find /home -name "*.png"
~~~

### hide errors in the denial of permission
~~~shell
find /home -name "*.jpg" 2>/dev/null
~~~


## Search by file type
- `f` - simple files
- `d` - directories
- `l` - symbolic links
- `b` - block devices (dev)
- `c` - symbolic devices (dev)
- `p` - named channels
- `s` - sockets

### directories only
~~~shell
find . -type d
~~~


## Search by file size
- `+` - Search for files larger than the specified size
- `-` - Search for files smaller than the specified size
- Absence of the sign means that the size of files in the search should be completely the same

~~~shell
find . -size +1G
~~~

- `c` - Byte
- `k` - Kbyte
- `M` - Mbyte
- `G` - Gbyte


## Search for empty files and directories
~~~shell
find . -empty
~~~


## Search by change time

### Search for all files modified in the last hour (less than 60 min)
~~~shell
find . -cmin -60
~~~


## Search by access time

###  Find files that have not been accessed in the last six months (180 days)
~~~shell
find . -atime +180
~~~


## Search by user name
~~~shell
find /home -user tisha 2>/dev/null
~~~


## Search by permission set
~~~shell
find /home -perm 777
~~~


## Operators
- `-and`
- `-or`
- `-not`

### Find files larger than 1 Gbyte of user tisha
~~~shell
find /home  -user tisha  -and  -size +1G  2>/dev/null
~~~

### Find files larger than 1 GB not only of user tisha, but also of user pokeristo
~~~shell
find /home \( -user pokeristo -or -user tisha \)  -and  -size +1G  2>/dev/null
~~~


## Actions
- `-delete` - Deletes files matching the search results
- `-ls` - Displays more detailed search results with:
  - File sizes
  - Number of inodes
- `-print` This is the default unless you specify another action. Shows the full path to the found files
- `-exec` Executes the specified command in each line of search results

### Find and delete all empty files
~~~shell
find . -empty -delete
~~~


### -exec
~~~shell
-exec command {} \;
~~~

- `command` is the command you wish to execute for the search results. For example:
  - `rm`
  - `mv`
  - `cp`
- `{}` is the search results.
- `\;` - The command ends with a semicolon after a backslash.

### Find and delete all empty files
~~~shell
find . -empty -exec rm {} \;
~~~

### Copy all `.jpg` images to the `backups/fotos` directory
~~~shell
find . -name "*.jpg" -exec cp {} /backups/fotos \;
~~~