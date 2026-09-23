# Data sources

All sources are public. Scrapers live in `src/lib/scrapers/`, run daily via
Vercel Cron, and record every run in `scrapes` (DB mode) or
`logs/scrapes.jsonl` (snapshot mode) with status, items found and items new.

## Working now

| Source | What we get | Status |
| --- | --- | --- |
| `example-listings` (this repo's `scripts/examples/listing-entries.json`) | seed pipeline demo | ✅ offline demo |

| `data.gov` | initial seed source | ✅ planned |
| `Census Bureau APIs` | initial seed source | ✅ planned |
| `BLS Public Data API` | initial seed source | ✅ planned |
| `FRED` | initial seed source | ✅ planned |
| `EIA` | initial seed source | ✅ planned |
| `USGS` | initial seed source | ✅ planned |
| `NOAA` | initial seed source | ✅ planned |
| `EPA` | initial seed source | ✅ planned |
| `CDC` | initial seed source | ✅ planned |
| `NREL` | initial seed source | ✅ planned |
| `USAspending API` | federal spending awards and accounts (Treasury) | ✅ planned |
<!-- SEED-SOURCES -->

## Candidate seeds from public-apis

`reports/public-apis-candidates.md` holds US entries from
[public-apis/public-apis](https://github.com/public-apis/public-apis) that this
readme does not already carry: Census.gov, Data.gov, the Federal Register, SEC
EDGAR, the FEC, FRED, and city portals for New York and Chicago among them.
Regenerate it with the command in `reports/README.md`.

Projects run `pnpm run setup` to list their own initial sources here; the
scraper framework in `src/lib/scrapers/` turns each into a `Scraper`.

## Best-effort (fetched, no structured extraction yet)

| Source | What we want | Status |
| --- | --- | --- |
| _(add sources here as scrapers land)_ | | ⚠️ |

## Key-gated (enable via env)

| Source | Env var | Notes |
| --- | --- | --- |
| _(add keyed APIs here, e.g. Eventfinda/Meetup)_ | `..._API_KEY` | Free key at the provider portal |

## Planned

- Real scrapers for the project's seed sources, replacing the example
- Headless-browser fallback for JS-rendered listing pages
- Enrichment passes (socials, contact, coordinates) with sources per field

## Rules

- Respect `robots.txt` (enforced in `src/lib/scrapers/http.ts`)
- 500ms+ delay between requests per source
- 15s request timeout; failures are recorded, never fatal
- No paywalled, logged-in, or private data. Ever.
- Update this table when a source changes status — it is the project's
  transparency record.
