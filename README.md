# scrot.bat

Script that emulates `scrot` used by `org-screenshot.el` for emacs org mode

## Usage

1. Add to your `$PATH`
2. Call 

``` shell
scrot -s test.png
```
3. Add to `org-download-screenshot-method`

``` shell
(when (eq system-type 'windows-nt)
    (setq org-download-screenshot-method "scrot.bat -s %s"))
```
