#!/bin/bash
# Thin entrypoint for the US directory grow loop.
# Shared logic lives in code/open-data/nz-usa-uk-data-stack/loops/loop-wrapper.sh.
exec "$HOME/code/open-data/nz-usa-uk-data-stack/loops/loop-wrapper.sh" \
  "$HOME/code/open-data/awesome-open-usa-data" \
  "$HOME/code/open-data/awesome-open-usa-data/scripts/grow-loop-prompt.txt" \
  "$HOME/code/open-data/awesome-open-usa-data/scripts/heal-grow-loop-prompt.txt" \
  awesome-open-usa-data
