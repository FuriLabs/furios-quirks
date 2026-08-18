#!/bin/sh

export EGL_PLATFORM=wayland
export COGL_DISABLE_MAPBUFFERRANGE=true

# Force gles on gdk
export GDK_GL=gles

# Disable webkitgtk bwrap sandbox for now
export WEBKIT_DISABLE_SANDBOX_THIS_IS_DANGEROUS=1

# Force GLVND to use hybris EGL.
#
# WebKitGTK probes displays in this order:
#   1. GBM
#   2. Surfaceless
#   3. EGL_DEFAULT_DISPLAY
#
# hybris does not provide a GBM platform, so WebKitGTK falls back
# to Mesa's surfaceless EGL implementation before reaching
# EGL_DEFAULT_DISPLAY. This results in Mesa swrast/llvmpipe being
# selected instead of hybris EGL breaking GPU acceleration.
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_libhybris.json

# Force gles on gstreamer and video players
export GST_GL_API=gles2

# Decode H.264 and VP9 in software. droidvdec decodes no valid H.264 frames and
# v4l2vp9dec hangs on VP9, so without this those files do not play at all.
export GST_PLUGIN_FEATURE_RANK=droidvdec:NONE,v4l2vp9dec:NONE

# Force gl on gsk
export GSK_RENDERER=gl

# Disable firefox crash reporter
export MOZ_CRASHREPORTER_DISABLE=1

# Disable GPU in QT web engine for now
export QTWEBENGINE_CHROMIUM_FLAGS="--disable-gpu"
