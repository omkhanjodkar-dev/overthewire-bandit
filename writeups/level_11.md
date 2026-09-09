# Bandit Level 11 → Level 12

## Level Goal

The password for the next level is stored in the file **data.txt**, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.

## Initial Observation

Using `ls`, I found the file `data.txt` in the home directory.

## Finding the Password

The contents used a ROT13 transformation for alphabetic characters. I reversed the transformation using:

```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

The decoded output revealed the password:

```text
GROozWPO8QyN0mGrjUkID0WCYkZiQxrN
```

## Password

```text
GROozWPO8QyN0mGrjUkID0WCYkZiQxrN
```
