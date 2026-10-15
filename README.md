# We Move Mobile Homes (`wmmhweb`)

Specialist Mobile Home, Static Caravan & Park Home Transport across the United Kingdom and International transit routes.

This project is built with **Astro**, **Tailwind CSS**, and **TypeScript** (Strict Mode), pre-configured for automated continuous deployment to a single production ("Live") environment on **Azure Static Web Apps**.

---

## 🚚 Business Scope
- **Mobile Home & Static Caravan Transport**: UK Nationwide and European relocations (single units, twin units, luxury holiday lodges).
- **Specialist Low Loader Haulage**: Extendable step-frame trailers engineered for abnormal widths and lengths.
- **Hiab Crane Hire & Siting**: Precision lifting over walls, hedges, and challenging park terrain with certified operators.
- **Abnormal Load Permits & Escorts**: Highways England ESDAL statutory notifications, police force liaisons, route surveys, and pilot escort vehicles.
- **Emergency Failed Transport Rescue**: Rapid breakdown response for stuck loads, fractured chassis, or compromised running gear.
- **Touring Caravan & Commercial Trailer Logistics**: UK and European door-to-door transit, customs clearance, and ferry transport.

---

## 🛠️ Technology Stack & Requirements
- **Runtime**: Node.js `>=26.0.0` (managed via [`.nvmrc`](.nvmrc))
- **Framework**: [Astro](https://astro.build) (Static Site Generation)
- **Styling**: [Tailwind CSS v4](https://tailwindcss.com) via `@tailwindcss/vite`
- **Sitemap**: Official [`@astrojs/sitemap`](https://docs.astro.build/en/guides/integrations-guide/sitemap/)
- **Type Checking**: TypeScript strict mode (`astro/tsconfigs/strict` with `@astrojs/check`)
- **Hosting Target**: [Azure Static Web Apps](https://azure.microsoft.com/en-us/products/app-service/static/)
- **SEO & GEO Standards**: Schema.org JSON-LD (`MovingCompany`, `AutoTransport`, `BreadcrumbList`), `robots.txt`, and [`llms.txt`](public/llms.txt)

---

## 📁 Project Structure

```text
wmmhweb/
├── public/                       # Static assets & public SEO artifacts
│   ├── favicon.ico
│   ├── favicon.svg
│   ├── llms.txt                  # Standardized AI/LLM search engine operational summary (GEO)
│   ├── robots.txt                # Crawler directives pointing to sitemap-index.xml
│   └── staticwebapp.config.json  # Azure SWA routing and security headers
├── src/
│   ├── components/               # Reusable UI components
│   │   ├── ContactCta.astro      # Quote inquiry form & dispatch details
│   │   ├── FleetHighlights.astro # Haulage specs & escort division
│   │   ├── Footer.astro          # Corporate footer & legal compliance
│   │   ├── Hero.astro            # Landing hero, company name & strapline
│   │   ├── Navbar.astro          # Sticky navigation header & quick CTA
│   │   └── Services.astro        # Core capability service cards
│   ├── layouts/
│   │   └── Layout.astro          # Base HTML5 shell, Schema.org JSON-LD, GSC & GA4
│   ├── pages/
│   │   └── index.astro           # Main landing page
│   ├── styles/
│   │   └── global.css            # Tailwind CSS entry & base styling
│   └── env.d.ts                  # Strict environment variable typings
├── .env.example                  # Template for environment configuration
├── .gitignore                    # Industry-standard git exclusions
├── .nvmrc                        # Node.js 26 runtime specification
├── astro.config.mjs              # Astro configuration with site URL, sitemap, and Tailwind
├── package.json                  # Scripts & dependencies
├── staticwebapp.config.json      # Root Azure SWA config reference
└── tsconfig.json                 # TypeScript strict configuration
```

---

## 🌿 Single-Trunk Development & Deployment Workflow

This repository adheres to a clean, single-trunk git architecture:
1. **Single Production Environment**: The production live environment is mapped exclusively to the `main` branch.
2. **Feature Development**:
   - Create short-lived feature or fix branches from `main` (e.g. `feat/pricing-calculator`, `fix/route-survey-metadata`).
   - Open a Pull Request targeting `main`.
   - Run quality checks (`npm run check` and `npm run build`) locally or via CI checks.
3. **Merge to Main**:
   - Merging or pushing to `main` automatically triggers the Azure Static Web Apps deployment workflow to build and promote the static site to the live production endpoint.

---

## 🔍 Google Tooling & Analytics Integration Guide

The application supports zero-code configuration for Google Search Console (GSC) and Google Analytics 4 (GA4) via environment variables or layout props.

### 1. Google Search Console (GSC)
To verify site ownership with Google Search Console via the HTML tag method:
1. Copy the verification code token from your Google Search Console property dashboard:
   `<meta name="google-site-verification" content="YOUR_TOKEN_HERE" />`
2. Add the token to your environment variables:
   ```bash
   PUBLIC_GOOGLE_SITE_VERIFICATION="YOUR_TOKEN_HERE"
   ```
   *(In Azure Static Web Apps, add this in the Azure Portal under **Configuration** > **Application Settings**).*

### 2. Google Analytics 4 (GA4)
To enable tracking across the site:
1. Copy your GA4 Measurement ID (formatted as `G-XXXXXXXXXX`) from Google Analytics Admin > Data Streams.
2. Add the measurement ID to your environment variables:
   ```bash
   PUBLIC_GA_MEASUREMENT_ID="G-XXXXXXXXXX"
   ```
   When defined, `Layout.astro` automatically injects the official Google tag script (`gtag.js`) into `<head>`.

### 3. Canonical Domain
Set `SITE_URL` to the live domain (defaults to `https://wemovemobilehomes.co.uk`):
```bash
SITE_URL="https://wemovemobilehomes.co.uk"
```

---

## 🤖 AI & LLM Search Engine Optimization (GEO)

- **`public/llms.txt`**: Serves as a curated operational profile for LLM retrieval and Generative Engine Optimization (e.g. ChatGPT Search, Perplexity, Claude, Apple Intelligence).
- **`public/robots.txt`**: Unblocks major AI and search engine crawlers and points to `https://wemovemobilehomes.co.uk/sitemap-index.xml`.
- **Schema.org Structured Data**: Incorporates a rich `@graph` in `Layout.astro` with `MovingCompany`, `AutoTransport`, `BreadcrumbList`, and `OfferCatalog`.

---

## 🚀 Local Development Commands

All commands are run from the repository root:

| Command | Action |
| :--- | :--- |
| `npm install` | Installs dependencies |
| `npm run dev` | Starts local development server at `http://localhost:4321` |
| `npm run check` | Runs strict Astro and TypeScript validation (`astro check`) |
| `npm run build` | Builds production bundle and sitemap to `./dist/` |
| `npm run preview` | Previews the production static build locally |
