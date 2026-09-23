# Loop notes

Dated log for the daily grow loop (`scripts/grow-loop-prompt.txt`). One line
per iteration, plus a fuller entry when something blocks the loop.

## 2026-09-23

- 2026-09-24 iteration. Link sweep of all 30 sources (website plus source URL,
  60 requests, four at a time): every one returned 200 from this host except
  `data.ed.gov`, which answers automated checks with 403 while serving
  browsers. That is the known bot-protection case already described in the
  `items.ts` header, so the link stays and the listing now carries a note
  saying so. `sam.gov` timed out here on 2026-09-23 and returned 200 today, so
  its note records both. `lastVerified` rolled forward to 2026-09-24 across
  the set (`12f6476`).
- Shipped three sources: `Treasury Fiscal Data API` (`4ad4692`), `NIH
  RePORTER` (`08303ec`), and `Washington State Open Data` (`33252bb`). Each
  was checked live before adding, including the API surface, not just the
  landing page: the Fiscal Data `v2/accounting/od/debt_to_penny` endpoint
  returns JSON, the NIH RePORTER `/v2/projects/search` POST returns a result
  set, and the `data.wa.gov` Socrata catalog API returns JSON.
- First sweep ran all 60 URLs at once and the last 26 requests failed with
  connection timeouts while the first 34 answered fine. That was parallelism,
  not dead sites: rerunning with four workers answered everything. Worth
  knowing before a future iteration logs a batch of false failures.
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
- Blocker fixed at the root: `pnpm run check:fast` starts with
  `build:snapshot`, which stamped `exportedAt` with a fresh `new Date()` on
  every run, so one green gate left `src/data/snapshot.json` modified. The
  wrapper's dirty check (`git diff --quiet -- . ':(exclude)LOOP-NOTES.md'`)
  then skipped every later iteration and would have fired a heal run after
  three. `scripts/build-snapshot.mjs` now reuses the committed `exportedAt`
  while the items are unchanged and skips the write, so a green gate leaves
  the tree clean, and the timestamp still moves when the data moves. Same fix
  the UK repo shipped in `7c14574`. Proven both ways: `check:fast` left
  `git status --short` empty, and a hand edit to `data-gov` moved `exportedAt`
  from `10:03:43.987Z` to `11:16:37.779Z` before the edit was reverted.
- The full `pnpm run check` (coverage, build, smoke, e2e) is not the loop's
  gate, but it does dirty the tree: `next dev`, which the e2e suite starts,
  rewrites `next-env.d.ts` to the `.next/dev/types` paths and re-adds the
  em-dash version of the generated `AGENTS.md` block that `71f51d4` had
  cleaned up. Both were reverted here; an iteration that runs the full suite
  has to do the same before it ends.
- Four CI workflows were already red before this batch and are still red, for
  reasons unrelated to the dataset: `ci.yml` spell check (codespell reads the
  `ot.mozmail.com` contact address as a typo of "to"), `quality.yml` Lighthouse
  (total blocking time 300ms against a 200ms budget), `security.yml`
  dependency audit (pnpm audit: 2 critical, 3 high, 3 moderate), and
  `github-pages.yml` build. The gate that covers this work, "Check (mirrors
  pnpm run check)" on 93ace39, passed, as did both E2E shards.
