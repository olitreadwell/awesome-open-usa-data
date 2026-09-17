#!/bin/bash
# Thin entrypoint for the US directory grow loop.
# Shared logic lives in code/usa-uk-data-stack/loops/loop-wrapper.sh.
exec "$HOME/code/usa-uk-data-stack/loops/loop-wrapper.sh" \
  "$HOME/code/awesome-open-usa-data" \
  "$HOME/code/awesome-open-usa-data/scripts/grow-loop-prompt.txt" \
  "$HOME/code/awesome-open-usa-data/scripts/heal-grow-loop-prompt.txt" \
  awesome-open-usa-data
