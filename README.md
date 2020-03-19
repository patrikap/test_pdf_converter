# test_pdf_converter
Solution for test task.

## Install
Install `a2ps` and `ps2pdf` packages:

```bash
sudo apt-get install a2ps t2html html2ps ghostscript
```

Clone repo:

```bash
git clone https://github.com/patrikap/test_pdf_converter.git ~/pdf_converter
```

Allow execute file

```bash
chmod +x ~/pdf_converter/to_pdf.sh
```
 
Create symlink to `/usr/bin` 

```bash
sudo ln -s ~/pdf_converter/to_pdf.sh /usr/bin/to_pdf
```
 
## Using

```bash
to_pdf *path_to_files*
```

## Uninstall

 ```bash
 rm -rf /usr/bin/to_pdf
 ```

## Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Author
 
[Patrikap](https://github.com/patrikap)