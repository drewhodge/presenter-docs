#!/bin/sh

case "$(uname -s)" in
  Darwin)
      echo "***** Running macOS code *****"
      echo
      /Applications/Emacs.app/Contents/MacOS/Emacs -Q --script presenter-publish.el
      ;;
  Linux)
      echo "***** Running Linux code *****"
      echo
      emacs -Q --script presenter-publish.el
      ;;
  *)
    echo "Unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac
