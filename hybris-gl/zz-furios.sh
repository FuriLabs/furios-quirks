#!/bin/sh

export EGL_PLATFORM=wayland
export COGL_DISABLE_MAPBUFFERRANGE=true

# Force gles on gdk
export GDK_GL=gles

# Disable webkitgtk bwrap sandbox for now
export WEBKIT_FORCE_SANDBOX=0
export WEBKIT_DISABLE_SANDBOX_THIS_IS_DANGEROUS=1

# Disable webkitgtk DMA-BUF renderer
export WEBKIT_DISABLE_DMABUF_RENDERER=1

# Force gles on gstreamer and video players
export GST_GL_API=gles2

# Force gles on glfw3
export GLFW_CLIENT_API=GLFW_OPENGL_ES_API
