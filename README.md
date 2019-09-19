# Splasher
Load random image as your desktop background from [unsplash.com](https://unsplash.com).

## Config File
Copy `splasher.conf` file to `.config` directory in your home directory.

## Configuration Parameters
- `WALLPAPER_NAME` saved file name.
- `DIR` A location to save downloaded wallpaper.
- `SEARCH_TERM` search keyword, You can use as multiple keyword and splite them with comma. If you leave it empty, load image randomlly.
- `ORIENTATION` You can filter images by orientations. Default is **landscape** but you can set it to **portrait** and **squarish**.
- `CLIENT_ID` For api authentication this ID needed. If you have not client id, don't change it.


## Dependencies
You should ensure that the following packages are installed on your system.
`feh`, `curl`, `jq`

---
### Tips:
* The downloaded image will be going to save as `${HOME}/.splasher/background.jpg`.

---
### TO DOs:
+ ~~search not support multiwords terms like "night sky"~~
+ ~~Load images from specific category.~~
+ ~~Load images from search results.~~
+ store downloaded images (optional)
+ ~~read configs from config file.~~
