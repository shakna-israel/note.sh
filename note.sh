#!/bin/sh

# Inherited by helper scripts.
VER='0.0.0'

# Find where this script is being run from,
# So we can source it's helper scripts.
root=$(dirname "$(readlink -f "$0")")

# Set our note directory.
if [ -z "$NOTESH_HOME" ]; then
  note_dir="$HOME"/.local/share/note.sh
else
  note_dir="$NOTESH_HOME"
fi

# Ensure our note directory exists.
if [ ! -d "$note_dir" ]; then
  mkdir -p "$note_dir"
  if [ ! -d "$note_dir" ]; then
    echo 'Fatal Error: Unable to create note directory.' >&2
    echo "Directory: $note_dir" >&2
    echo 'Do you have permission?' >&2
    exit 1
  fi
fi

# Help interface
if [ -z "$1" ] || [ "$1" = '-h' ] || [ "$1" = '--help' ]; then
  . "$root"/.help
  help
  exit 0
fi

# List interface
if [ "$1" = 'list' ]; then
  . "$root"/.list
  list
  exit 0
fi

# Search interface
if [ "$1" = 'search' ]; then
  . "$root"/.search
  if [ -z "$2" ]; then
    echo 'Expected a search term. None found.' >&2
    exit 1
  fi
  search "$2"
  exit 0
fi

# Edit interface
if [ -z "$2" ]; then
  . "$root"/.edit
  # We know $1 exists, because if not, help gets called.
  edit "$1"
  exit 0
fi

# Tag interface

# Add tag interface
if [ "$2" = '--tag' ] || [ "$2" = '-t' ]; then
  . "$root"/.tag
  if [ -z "$3" ]; then
    echo 'Expected a tag, none provided.'' >&2
    exit 1
  fi
  tag "$1" "$3"
  exit 0
fi

# Remove tag interface
if [ "$2" = '--untag' ] || [ "$2" = '-ut' ]; then
  . "$root"/.tag
  if [ -z "$3" ]; then
    echo 'Expected a tag to remove, none provided.'' >&2
    exit 1
  fi
  untag "$1" "$3"
  exit 0
fi

# Relationship interface

# Linking
if [ "$2" = '--link' ] || [ "$2" = '-l' ]; then
  . "$root"/.link
  if [ -z "$3" ]; then
    echo 'Expected a document to link with. None provided.' >&2
    exit 1
  fi
  link "$1" "$3"
  exit 0
fi

# Unlinking
if [ "$2" = '--unlink' ] || [ "$2" = '-ul' ]; then
  . "$root"/.link
  if [ -z "$3" ]; then
    echo 'Expected a document to unlink from. None provided.' >&2
    exit 1
  fi
  unlink "$1" "$3"
  exit 0
fi
