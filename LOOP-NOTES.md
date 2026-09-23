# Loop notes

Dated log for the daily grow loop (`scripts/grow-loop-prompt.txt`). One line
per iteration, plus a fuller entry when something blocks the loop.

## 2026-09-23

- Shipped three sources: `USAspending API`, `openFDA`, and `New York State
  Open Data`. Each link was checked live before adding (api.usaspending.gov,
  open.fda.gov/apis, data.ny.gov: all 200).
- Link re-check found two bad links, both repaired in `d43c8df`. NOAA's
  `/information-technology/open-apis` page now returns 404, so its source
  points at the NOAA data hub. sam.gov does not answer automated checks from
  this host (two 30s timeouts, and api.sam.gov fails the TLS handshake), so
  its source points at GSA's Entity Management API docs, which return 200.
  Every other source returned 200 and rolled forward to 2026-09-23.
- Not a blocker, but worth knowing: `scripts/build-snapshot.mjs` stamps
  `exportedAt` with the current time, so any run of `pnpm run check:fast`
  rewrites `src/data/snapshot.json` and leaves the tree dirty. This iteration
  ended clean with `git checkout -- src/data/snapshot.json`. If a later
  iteration is skipped for "main has uncommitted changes" and the only diff is
  that timestamp, this is why.
- Four CI workflows were already red before this batch and are still red, for
  reasons unrelated to the dataset: `ci.yml` spell check (codespell reads the
  `ot.mozmail.com` contact address as a typo of "to"), `quality.yml` Lighthouse
  (total blocking time 300ms against a 200ms budget), `security.yml`
  dependency audit (pnpm audit: 2 critical, 3 high, 3 moderate), and
  `github-pages.yml` build. The gate that covers this work, "Check (mirrors
  pnpm run check)" on 93ace39, passed, as did both E2E shards.
