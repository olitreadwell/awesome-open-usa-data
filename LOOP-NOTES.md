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

## 2026-09-25

- Link sweep of every listed URL (41 unique after dedupe, four requests at a
  time): all returned 200 except `data.ed.gov`, the known bot-protection 403
  that still serves browsers. No URL changes needed, and `lastVerified` rolled
  forward to 2026-09-25 across the set (`548fe4b`).
- Shipped three sources, each checked live before adding, including the API
  surface rather than just the landing page: `SEC EDGAR APIs` (`6c4bfb0`),
  `CMS Provider Data` (`e093489`), and `Michigan Open Data` (`208c343`). The
  checks that backed them: `data.sec.gov/submissions/CIK0000320193.json`
  returns JSON and the full-index archive page returns 200; the CMS
  provider-data metastore API returns 237 dataset records and
  `Hospital_General_Information.csv` downloads as 1.4 MB of `text/csv`; the
  `data.michigan.gov` SODA query on dataset `4qfe-hfck` returns JSON.
- `data.cms.gov` serves its provider-data pages fine but answers 403 on the
  site root and on `/api-documentation`, so the listing points at
  `/provider-data/` and `/provider-data/docs`, both 200 from this host.
- `pnpm run check:fast` green (snapshot, format, lint, typecheck, data tests,
  links, build) with the tree clean afterwards. Coverage, e2e, and smoke run
  in CI on the push.

## 2026-09-27

- Link sweep of every listing (42 listings, 53 unique URLs after dedupe, four
  requests at a time): all 53 answered 200, including `data.ed.gov` (the
  long-running bot-protection 403) and `eia.gov`, which answered a bare fetch
  this run. Four addresses now redirect and are stored at the destination:
  `www.data.gov` to `data.gov`, `data.bls.gov/developers/` to
  `www.bls.gov/developers/`, the Federal Register API docs path, and
  `sam.gov/content/entity-information` to `sam.gov/entity-information`.
  `lastVerified` rolled forward to 2026-09-27 (`6ea84b3`).
- Two listings had actually moved. `data.cityofnewyork.us` 301s to
  `nyc.gov/opendata`, so the website field points at the city's new portal
  while the source stays on the Socrata API host, which still returns JSON for
  `resource/erm2-nwe9.json`. `openstates.org` 301s to `pluralpolicy.com/open`,
  and the Open States data now lives at `open.pluralpolicy.com` (bulk data page
  plus API key registration, both 200 without auth), so the listing points
  there and the description no longer calls the project a nonprofit.
- Shipped three sources, each checked live before adding, including the API
  surface rather than just the landing page: `FRED (Federal Reserve Economic
  Data)` (`b6d7195`), `OpenFEC API` (`74789ec`), and `GovInfo API`
  (`f47310a`). Evidence behind each: FRED's own meta description states
  853,000 series from 126 sources, `fred.stlouisfed.org` and the v1/v2 API
  docs return 200, and `api.stlouisfed.org/fred/series` returns 400 without a
  valid key, which proves the endpoint is live and key-gated; the FEC's
  `/committees/`, `/filings/`, `/schedules/schedule_a`, `schedule_b`,
  `schedule_e`, `/audit-case/`, and `/legal/search/` endpoints all return JSON
  with DEMO_KEY (the 429 "rate limit of 40 calls per hour for the DEMO_KEY"
  confirms the key gate), and the bulk data page at `fec.gov/data` returns
  200; `api.govinfo.gov/collections` returns the full collection list with
  DEMO_KEY (BILLS, BILLSTATUS, CREC, FR, CFR, USCODE, PLAW, USCOURTS, BUDGET,
  and more), with the docs and bulk data pages returning 200 beside it.
- NREL was checked as a fourth candidate and skipped: `nrel.gov` and
  `developer.nrel.gov` do not resolve from this host, so it stays a planned
  source in `DATA_SOURCES.md` rather than a listing.
- `pnpm run check:fast` green (snapshot, format, lint, typecheck, data tests,
  links, build) with the tree clean afterwards. Coverage, e2e, and smoke run
  in CI on the push.

## 2026-09-26

- Link sweep of every listed URL (46 unique after dedupe, four requests at a
  time): 45 answered 200 on the first pass. `eia.gov/opendata/` answered 503
  to a scripted user-agent and 200 to a browser user-agent, so it stays as
  listed. `data.ed.gov`, the long-running bot-protection 403, answered 200
  today. No URL changes were needed and `lastVerified` rolled forward to
  2026-09-26 across the set (`361f237`).
- Shipped three sources, each checked live before adding, including the API
  surface rather than just the landing page: `FDIC BankFind Suite API`
  (`6273682`), `USDA NASS Quick Stats API` (`3e246c5`), and `San Francisco
  Open Data` (`52d45b2`). The checks that backed them: every
  `api.fdic.gov/banks/*` family (institutions, locations, financials, history,
  summary, failures, sod) returns JSON without a key, and
  `banks.data.fdic.gov/api/*` now 301s to that host while
  `banks.data.fdic.gov/docs` redirects to `api.fdic.gov/banks/docs`; Quick
  Stats answers 401 without a key at `quickstats.nass.usda.gov/api/api_GET/`,
  which proves the endpoint is live and key-gated rather than broken; the
  `data.sf.gov` SODA endpoint returns JSON, CSV, and GeoJSON for dataset
  `wg3w-h783` (Police Department Incident Reports).
- `data.sfgov.org` now 301s to `data.sf.gov`; the new portal's own page says
  the address changed and the SODA API is unchanged, so the listing points at
  the new host. Its `/api/catalog/v1` federated search returns datasets from
  other cities, which is a quirk of that endpoint rather than a sign the
  portal is wrong: `/api/views.json` and per-dataset resource queries are
  scoped to San Francisco.
- The prompt's step 1 names `scripts/check-external-links.mjs` as the link
  checker, but that script enforces `target="_blank"` on external links in
  JSX. The URL liveness sweep is done here by hand each iteration.
- `pnpm run check:fast` green (snapshot, format, lint, typecheck, data tests,
  links, build) with the tree clean afterwards. Coverage, e2e, and smoke run
  in CI on the push.
