# Changelog

All notable changes documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### Changed

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
