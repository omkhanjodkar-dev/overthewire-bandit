# Bandit Level 12 → Level 13

## Level Goal

The password for the next level is stored in the file **data.txt**, which is a hexdump of a file that has been repeatedly compressed.

## Preparing the File

I first created a temporary working directory and copied `data.txt` into it:

```bash
mkdir /tmp/ok12
cp data.txt /tmp/ok12
cd /tmp/ok12
```

I then reversed the hexdump using:

```bash
xxd -r data.txt data.bin
```

The resulting file was identified as gzip-compressed data:

```bash
file data.bin
```

## Repeated Decompression

I renamed and decompressed the file according to the compression format reported by `file`. The data went through multiple layers of gzip, bzip2, and tar archives.

The main sequence was:

```bash
mv data.bin data.gz
gzip -d data.gz
mv data data.bz2
bzip2 -d data.bz2
mv data data.gz
gzip -d data.gz
tar -xf data
tar -xf data5.bin
mv data6.bin data.bz2
bzip2 -d data.bz2
rm data
tar -xf data
mv data8.bin data.gz
rm data
gzip -d data.gz
```

During the process, an existing output file caused a decompression error, so the conflicting file was removed before continuing.

After the final decompression, `file data` identified the result as ASCII text.

## Finding the Password

I displayed the final text file using:

```bash
cat data
```

The password was:

```text
qQYQiHOBPR8zR61qxYqX45quvihF2uzk
```

## Password

```text
qQYQiHOBPR8zR61qxYqX45quvihF2uzk
```
