# Midweek Bass Anglers — Site Rebuild Handoff

Pick this up in Cowork. Don't redo anything in the "Already decided" section.

## Goal
Rebuild midweekbassaz.com as a professional static site → host on user's Firebase → custom domain `derbysignup.com` (registered at GoDaddy).

## Files already on disk
Folder: `/Users/tim/Desktop/midweek-bass-site/`

| File | Status | Notes |
|---|---|---|
| `styles.css` | **Keep** | Full design system, ~400 lines. Read it — don't rewrite. |
| `firebase.json` | **Keep** | Hosting config: cleanUrls, caching headers. Ready to deploy. |
| `logo.svg` | **Discard** | Hand-coded fish — user rejected as "generic." Replace with real logo. |
| `HANDOFF.md` | This doc | |

Reference (do not edit): `/Users/tim/Desktop/midweek-bass-redesign.html` — original single-file home page mockup. Use as visual reference for the layout patterns already approved.

## Already decided (don't relitigate)

**Palette** (locked, defined in styles.css `:root`)
- `--navy: #0b2545` — primary dark
- `--deep: #13315c`
- `--water: #1d6a96`
- `--sand: #f4ede4` — page background
- `--sun: #e8a23a` — gold accent
- `--sunset: #d05a3c` — secondary accent
- `--ink: #1a1a1a`, `--muted: #6b7280`, `--line: #e5e0d6`

**Typography**
- Headings: Georgia / Times New Roman (serif, heritage feel)
- Body: system sans

**Voice**: confident, established, est. 1979. **Not** self-deprecating. Original site's "we're anglers, not website gurus" — that's been flipped to "Forty-six seasons of doing this right — on the water and online."

**Layout patterns approved**: see `midweek-bass-redesign.html`. Sticky navy header with gold accent bar, hero with countdown card, schedule list with status pills, AOY leaderboard panel + stat cards, navy membership banner.

## What's still needed

### 1. Professional logo (user rejected hand-coded SVG)
Two acceptable approaches:
- **Typographic / heritage wordmark** — "MBA" monogram or stacked "MIDWEEK / BASS / ANGLERS" in heavy serif. No fish illustration.
- **Generated bass illustration** — use image gen (DALL-E, Midjourney via Cowork tools) to create a real bass logo, then save as SVG/PNG to the folder.

User wants this to look like "a guru made it." College athletic department / pro fishing tournament tier, not clipart.

### 2. Real icon set
Use **Phosphor Icons** or **Heroicons**, not hand-coded paths. Need: calendar, trophy, map-pin, clock, fish, dollar, scale, check, arrow-right, waves, mail, users, info.

### 3. Five HTML pages
All share `styles.css`, all share the same header/footer markup.

1. **index.html** — Hero with next-tournament card and live countdown, schedule preview (next 5), AOY snippet + stat cards, membership banner, footer
2. **tournaments.html** — Full 11-event schedule, rules, etiquette, entry process
3. **standings.html** — Full AOY leaderboard, past results cards, past AOY winners
4. **membership.html** — Why join, dues breakdown, application form, code of conduct
5. **about.html** — History, board of directors card grid, meeting info, FAQ accordion, contact

Plus `404.html` (Firebase Hosting picks it up automatically).

Nav links: Tournaments, Standings, Membership, About, Member Login (CTA).

### 4. Firebase deploy
```bash
cd /Users/tim/Desktop/midweek-bass-site
firebase login          # opens browser; user is already logged in
firebase init hosting   # use existing project; public dir = "."; do NOT overwrite firebase.json or index.html
firebase deploy --only hosting
```

### 5. Point derbysignup.com at Firebase
1. Firebase console → Hosting → "Add custom domain" → enter `derbysignup.com`
2. Firebase shows 1 TXT (verification) + 2 A records
3. GoDaddy → My Products → derbysignup.com → DNS → add those records (delete any conflicting A records on `@`)
4. Back in Firebase, click verify. Cert provisions in 15–60 min.

## Mock data hints
Schedule lakes (real AZ bass lakes): Roosevelt, Pleasant, Apache, Bartlett, Saguaro, Alamo, Havasu, Martinez. Real placeholder name from current site: Floyd Vaughan (Tournament Director). Other names in mockup are placeholders to swap.

## Out of scope for first deploy
- Member login system (the "Member Login" CTA can link to a placeholder for now)
- Online payments (Stripe) — add later
- Live AOY data from a Google Sheet — nice-to-have, not v1
