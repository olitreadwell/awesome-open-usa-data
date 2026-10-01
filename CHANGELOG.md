# Changelog

All notable changes documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### Changed

- 2026-10-02: re-checked every listing URL and source link, 81 unique
  addresses after dedupe, four requests at a time. Seventy-eight answered
  200 on the first pass. Three federal pages answer scripted checks with 403
  (bot protection) and render in Chrome: transportation.gov/data (US DOT),
  fema.gov/about/reports-and-data/openfema, and
  nhtsa.gov/nhtsa-datasets-and-apis, each opened in a browser today. No URL
  moved, `lastVerified` rolled forward to 2026-10-02, and the FEMA listing
  now records the 403 alongside the existing notes on the other two.
- 2026-10-01: `HealthData.gov` (healthdata.gov) added to the dataset.
- 2026-10-01: `Pennsylvania Open Data` (data.pa.gov) added to the dataset.
- 2026-10-01: `Bureau of Transportation Statistics` (data.bts.gov) added to
  the dataset.
- 2026-10-01: re-checked every listing URL and source link, 75 unique
  addresses after dedupe, four requests at a time. Seventy answered 200.
  Five federal pages answer scripted checks with 403 and render in Chrome:
  transportation.gov/data (US DOT), nhtsa.gov/nhtsa-datasets-and-apis,
  noaa.gov, noaa.gov/data, and regulations.gov. Each was opened in a real
  browser today and kept its URL. `lastVerified` rolled forward to
  2026-10-01.
- 2026-09-30: re-checked all 48 listing URLs and source links, 69 unique
  addresses after dedupe, four requests at a time. Most answered 200 on the
  first pass. Five federal sites answer scripted checks with 403 while
  staying live for browsers or for a declared user-agent: transportation.gov
  (verified in Chrome today), bls.gov, fema.gov, sec.gov, and nhtsa.gov, plus
  consumerfinance.gov which needs the declared user-agent too.
  fred.stlouisfed.org answered HTTP/2 with INTERNAL_ERROR and 200 over
  HTTP/1.1, so the sweep now pins HTTP/1.1. One listing moved:
  transportation.gov/data blocks every scripted client, so the US DOT listing
  points at the data portal it names, data.transportation.gov, and keeps the
  program page as its source with a note. `lastVerified` rolled forward to
  2026-09-30.
- 2026-09-29: re-checked every listing URL and source link, 65 unique
  addresses after dedupe, four requests at a time. All 65 answered 200 on
  the first pass, so no URL changed and `lastVerified` rolled forward to
  2026-09-29 across the set. `data.cityofnewyork.us` still redirects to
  nyc.gov/opendata, the move recorded on 2026-09-27.
- 2026-09-28: re-checked every listing URL and source link, 59 unique
  addresses after dedupe, four requests at a time. All 59 answered 200 on the
  first pass, so no URL changed and `lastVerified` rolled forward to
  2026-09-28 across the set. `data.cityofnewyork.us` still redirects to
  nyc.gov/opendata, the move recorded on 2026-09-27.
- 2026-09-27: re-checked every listing URL and source link (53 unique
  addresses after dedupe, four requests at a time). All 53 answered 200,
  including `data.ed.gov` (the long-running bot-protection 403) and
  `eia.gov`, which answered this run. Redirects are now stored at their
  destination: data.gov, the BLS developer docs, the Federal Register API
  docs, and SAM.gov entity information. Two listings had moved for real:
  `data.cityofnewyork.us` 301s to nyc.gov/opendata, so the listing points at
  the city's new portal while the Socrata API host stays as the source, and
  `openstates.org` 301s to Plural Policy, so the Open States listing now
  points at open.pluralpolicy.com, where the bulk data and API keys live.
  `lastVerified` rolled forward to 2026-09-27.
- 2026-09-26: re-checked all 36 listing URLs (46 unique after dedupe, four
  requests at a time). Every one answered: 45 with HTTP 200 and eia.gov
  with a 503 to a bare scripted user-agent but 200 to a browser user-agent,
  so that listing stands as-is. data.ed.gov, the long-running 403, answered
  200 on this run. `lastVerified` rolled forward to 2026-09-26.
- 2026-09-25: re-checked all 33 source links. Every one answered on this
  run except data.ed.gov, which keeps returning 403 to automated checks
  while serving browsers. `lastVerified` rolled forward to 2026-09-25.
- 2026-09-24: re-checked all 30 source links. Every one answered on this run
  except data.ed.gov, which returns 403 to automated checks while serving
  browsers (notes on that listing now say so). `lastVerified` rolled forward
  to 2026-09-24.
- 2026-09-23: re-checked all 27 source links. NOAA's old
  `/information-technology/open-apis` page now 404s (source repointed to the
  NOAA data hub) and SAM.gov does not answer automated checks from this host
  (source repointed to the GSA Entity Management API docs, which return 200).
  Every other link returned 200, so `lastVerified` rolled forward to
  2026-09-23.

### Added

- 2026-10-02: `Illinois Open Data` (data.illinois.gov, Socrata SODA API)
  added to the dataset.
- 2026-10-02: `AirNow API` (docs.airnowapi.org, key-gated current and
  forecast AQI observations) added to the dataset.
- 2026-10-02: `ClinicalTrials.gov API` (clinicaltrials.gov/api/v2,
  keyless JSON plus a bulk download) added to the dataset.
- 2026-09-30: `CFPB Open Data` (consumerfinance.gov/data-research, consumer complaint search API) added to the dataset.
- 2026-09-30: `NHTSA Vehicle APIs` (api.nhtsa.gov, documented at nhtsa.gov/nhtsa-datasets-and-apis) added to the dataset.
- 2026-09-30: `Oregon Open Data` (data.oregon.gov, Socrata SODA API) added to the dataset.
- 2026-09-29: `Congress.gov API` (api.congress.gov/v3, key from
  api.data.gov) added to the dataset.
- 2026-09-29: `Regulations.gov API` (api.regulations.gov v4, documented at
  open.gsa.gov/api/regulationsgov) added to the dataset.
- 2026-09-29: `FBI Crime Data Explorer API` (api.usa.gov/crime/fbi/cde)
  added to the dataset.

- 2026-09-29: `Congress.gov API` (api.congress.gov/v3, key from
  api.data.gov) added to the dataset.
- 2026-09-29: `Regulations.gov API` (api.regulations.gov v4, documented at
  open.gsa.gov/api/regulationsgov) added to the dataset.
- 2026-09-29: `Congress.gov API` (api.congress.gov/v3, key from
  api.data.gov) added to the dataset.
- 2026-09-28: `Smithsonian Open Access` (api.si.edu EDAN Open Access API,
  bulk files on the AWS Open Data registry) added to the dataset.
- 2026-09-28: `USDA FoodData Central` (fdc.nal.usda.gov, API at
  api.nal.usda.gov/fdc/v1) added to the dataset.
- 2026-09-28: `National Weather Service API` (api.weather.gov, documented at
  weather.gov/documentation/services-web-api) added to the dataset.
- 2026-09-27: `GovInfo API` (api.govinfo.gov, bulk data at
  govinfo.gov/bulkdata) added to the dataset.
- 2026-09-27: `OpenFEC API` (api.open.fec.gov, with bulk downloads at
  fec.gov/data) added to the dataset.
- 2026-09-27: `FRED (Federal Reserve Economic Data)` (fred.stlouisfed.org,
  api.stlouisfed.org) added to the dataset.
- 2026-09-26: `San Francisco Open Data` (data.sf.gov, the new home of
  data.sfgov.org) added to the dataset.
- 2026-09-26: `USDA NASS Quick Stats API` (quickstats.nass.usda.gov)
  added to the dataset.
- 2026-09-26: `FDIC BankFind Suite API` (api.fdic.gov/banks) added to the
  dataset.
- 2026-09-25: `Michigan Open Data` (data.michigan.gov) added to the
  dataset.
- 2026-09-25: `CMS Provider Data` (data.cms.gov provider data) added to
  the dataset.
- 2026-09-25: `SEC EDGAR APIs` (sec.gov EDGAR APIs, data.sec.gov) added to
  the dataset.
- 2026-09-24: `Treasury Fiscal Data API` (fiscaldata.treasury.gov) added to
  the dataset.
- 2026-09-24: `NIH RePORTER` (reporter.nih.gov, api.reporter.nih.gov) added to
  the dataset.
- 2026-09-24: `Washington State Open Data` (data.wa.gov) added to the dataset.
- 2026-09-23: `New York State Open Data` (data.ny.gov) added to the dataset.
- 2026-09-23: `openFDA`, the FDA's public drug, device, food, and label APIs,
  added to the dataset.
- 2026-09-23: `USAspending API`, the Treasury's federal spending API, added to
  the dataset.
- Dataset-directory template layer over the base starter:
  - Generic `items` schema (zod) with seed dataset + snapshot mode
    (`src/data/snapshot.json`) and Postgres mode (`items`, `scrapes`,
    `candidates`, `analytics`)
  - OpenAPI API surface: `/api/v1/items`, `/items/{id}`, `/cities`,
    `/categories`, `/dataset` (JSON+CSV, ETag/version), `/dataset/meta`,
    `/api/search`, `/api/items/{id}/view`, `/api/opt-out`,
    `/api/cron/refresh`, subscribe/unsubscribe; Swagger at `/docs`;
    live-server contract test in smoke
  - Website: browse, fuzzy search, detail pages with community
    add/fix/review issue links, map, opt-out, dark mode
  - Feeds: `/feed.xml`, `/calendar.ics`, dynamic `/sitemap.xml`,
    `/robots.txt`
  - Scraper framework: robots.txt checks, rate limiting, backoff+jitter,
    per-run scrapes logging, candidate discovery→verification→promotion,
    with an offline example scraper
  - Vercel Cron daily refresh (2am NZT, `CRON_SECRET`-guarded)
  - Extended `pnpm run setup` scaffolder (thing, city, region, seed
    sources, deploy target) + `sync-from-template.mjs` pointed at this
    repo; docs: TEMPLATE_USAGE, DATA_SOURCES, SELF_IMPROVEMENT
- Starter template skeleton: Next.js, TS strict, Tailwind 4, Vitest,
  Playwright, ESLint 9, Prettier, husky, Docker, CI.
- Tracked follow-up: user feedback feature →
  https://github.com/olitreadwell/dataset-directory-template/issues/1
