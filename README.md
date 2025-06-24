# Photo Organizer Script
======================

This is a simple Bash script that automatically organizes image files into folders
based on their modification date (month and year). It's useful for sorting photos
that are all mixed in one directory.

The script scans the current directory for `.jpg`, `.jpeg`, and `.png` files,
extracts their modification date, creates folders for each year and month, and
moves each image into its corresponding folder.

Example output folder structure:
  ./2023/january/
  ./2023/february/
  ./2024/march/
  ...

### Dependencies
------------

- ImageMagick (`identify` command)

To install ImageMagick on Debian/Ubuntu-based systems:

```
    sudo apt update
    sudo apt install imagemagick
```

### Usage
-----

1. Place the script in the folder where your photos are.
2. Make it executable:

```
       chmod +x organize.sh
```

3. Run it:

```
       ./organize.sh
```


