# st version
VERSION = 0.8.2

# Customize below to fit your system and preferences.

# Solarized theme (either SOLARIZED_DARK or SOLARIZED_LIGHT)
SOLARIZED_THEME = SOLARIZED_DARK

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2`

# flags
STEXTRAFLAGS = -D$(SOLARIZED_THEME)
# Use this to use bright system colors [8-15] instead of basic system colors
# [0-7] if the bold attribute is set.
#STEXTRAFLAGS = -D$(SOLARIZED_THEME) -DDRAW_BOLD_TEXT_IN_BRIGHT_COLORS
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 $(STEXTRAFLAGS)
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

# OpenBSD:
#CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
#LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
#       `pkg-config --libs fontconfig` \
#       `pkg-config --libs freetype2`

# compiler and linker
# CC = c99
