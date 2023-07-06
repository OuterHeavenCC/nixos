{ colorscheme }:
''
##########################################
## Tabs
##########################################

# Inactive tabs
[tabs.inactive]

# Active tabs
[tabs.active]
invert=true

##########################################
## File List - Selections
##########################################

# Selected files (standard selection)
[selection]
fg = "#${colorscheme.colors.base09}"
bold = true

# Files selected in current visual mode
[visual_mode_selection]
fg = "#${colorscheme.colors.base06}"
bold = true

[selection.prefix]
prefix = "  "
size = 2

##########################################
## File List - System File Types
##########################################

# Basic style, used for regular files (and also device files and FIFOs)
[regular]
fg = "#${colorscheme.colors.base05}"

# For directories
[directory]
fg = "#${colorscheme.colors.base0D}"
bold = true

# For symbolic links
[link]
fg = "#${colorscheme.colors.base0C}"
bold = true

# For socket files
[socket]
fg = "#${colorscheme.colors.base0F}"
bold = true

##########################################
## File List - Exceptional Files
##########################################

# Files marked as executable
[executable]
fg = "#${colorscheme.colors.base0B}"
bold = true

# Invalid symbolic links (pointing to non-existing target)
[link_invalid]
fg = "#${colorscheme.colors.base08}"
bold = true

##########################################
## File list - Override style by extension
##########################################
# This sections allows to override the basic 
# style with a specific style for the file's
# extension.

[ext]

bmp.fg = "#${colorscheme.colors.base0A}"
gif.fg = "#${colorscheme.colors.base0A}"
heic.fg = "#${colorscheme.colors.base0A}"
jpg.fg = "#${colorscheme.colors.base0A}"
jpeg.fg = "#${colorscheme.colors.base0A}"
pgm.fg = "#${colorscheme.colors.base0A}"
png.fg = "#${colorscheme.colors.base0A}"
ppm.fg = "#${colorscheme.colors.base0A}"
svg.fg = "#${colorscheme.colors.base0A}"

wav.fg = "#${colorscheme.colors.base0E}"
flac.fg = "#${colorscheme.colors.base0E}"
mp3.fg = "#${colorscheme.colors.base0E}"
amr.fg = "#${colorscheme.colors.base0E}"

avi.fg = "#${colorscheme.colors.base0E}"
flv.fg = "#${colorscheme.colors.base0E}"
m3u.fg = "#${colorscheme.colors.base0E}"
m4a.fg = "#${colorscheme.colors.base0E}"
m4v.fg = "#${colorscheme.colors.base0E}"
mkv.fg = "#${colorscheme.colors.base0E}"
mov.fg = "#${colorscheme.colors.base0E}"
mp4.fg = "#${colorscheme.colors.base0E}"
mpg.fg = "#${colorscheme.colors.base0E}"
rmvb.fg = "#${colorscheme.colors.base0E}"
webm.fg = "#${colorscheme.colors.base0E}"
wmv.fg = "#${colorscheme.colors.base0E}"

7z.fg = "#${colorscheme.colors.base08}"
bz2.fg = "#${colorscheme.colors.base08}"
gz.fg = "#${colorscheme.colors.base08}"
rar.fg = "#${colorscheme.colors.base08}"
tar.fg = "#${colorscheme.colors.base08}"
tgz.fg = "#${colorscheme.colors.base08}"
xz.fg = "#${colorscheme.colors.base08}"
zip.fg = "#${colorscheme.colors.base08}"
''
