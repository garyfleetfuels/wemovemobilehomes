# We Move Mobile Homes (`wemovemobilehomes`)

Specialist Mobile Home, Static Caravan & Park Home Transport across the United Kingdom and Europe.

Built with **Astro 7**, **Tailwind CSS v4**, and **TypeScript** (Strict Mode), provisioned via **Terraform**, and configured for automated CI/CD deployments to **Azure Static Web Apps**.

- **Repository**: [https://github.com/garyfleetfuels/wemovemobilehomes](https://github.com/garyfleetfuels/wemovemobilehomes)
- **Live Azure Endpoint**: [https://agreeable-forest-0a5a9fe0f.4.azurestaticapps.net](https://agreeable-forest-0a5a9fe0f.4.azurestaticapps.net)
- **Production Target Domain**: `https://wemovemobilehomes.co.uk`

---

## 🚚 Business Scope & Core Services
- **Moving Mobile Homes & Caravans**: Complete removal, transport, and delivery. Splitting, sheeting, and reassembly of twin units, plus site removal and responsible disposal.
- **Touring Caravans**: Door-to-door collection, transit, and delivery across local routes, UK nationwide destinations, and European international journeys.
- **Abnormal Loads & Low Loader Haulage**: Step-frame low loaders engineered for oversized widths and lengths, Hiab crane hire & lifting, movement orders, and police/ESDAL statutory notifications.
- **Terms & Legal Compliance**: 28-clause Terms and Conditions of Carriage under England & Wales jurisdiction, incorporating RHA 2010 conditions, £85/hr demurrage, and strict 2ft clearance and hard-standing requirements.

---

## 🛠️ Technology Stack & Requirements
- **Runtime**: Node.js `>=26.0.0` (managed via [`.nvmrc`](.nvmrc))
- **Framework**: [Astro 7](https://astro.build) (Static Site Generation with native `<Image />` optimization)
- **Styling**: [Tailwind CSS v4](https://tailwindcss.com) via `@tailwindcss/vite`
- **Infrastructure as Code**: Terraform with `Azure/avm-res-web-staticsite/azurerm` (Azure Verified Modules)
- **Type Checking**: TypeScript strict mode (`astro/tsconfigs/strict` with `@astrojs/check`)
- **Hosting Target**: [Azure Static Web Apps](https://azure.microsoft.com/en-us/products/app-service/static/) (Free Tier, Anycast Edge)
- **SEO & AI Discoverability**: Schema.org JSON-LD (`MovingCompany`, `AutoTransport`, `OfferCatalog`), `robots.txt`, [`llms.txt`](public/llms.txt), and ARD [`ai-catalog.json`](public/ai-catalog.json)

---

## 📁 Project Structure

```text
wemovemobilehomes/
├── .github/
│   └── workflows/
│       └── azure-static-web-apps.yml  # GitHub Actions CI/CD to Azure SWA
├── infra/                             # Terraform infrastructure as code
│   ├── main.tf                        # AVM Azure Static Web App definition
│   ├── variables.tf                   # Target region, RG, and tagging variables
│   ├── outputs.tf                     # SWA default hostname & API key
│   └── versions.tf                    # azurerm, azapi, and modtm providers
├── public/                            # Static assets & crawler manifests
│   ├── .well-known/
│   │   └── ai-catalog.json            # Agent Resource Directory (ARD) catalog
│   ├── images/                        # Static raster & vector brand graphics
│   │   └── websitelogocolour2.svg     # Brand vector logo
│   ├── ai-catalog.json                # ARD root manifest for autonomous agents
│   ├── favicon.svg                    # Scalable vector favicon
│   ├── favicon.ico                    # Multi-resolution fallback icon
│   ├── favicon-16x16.png              # Display fallback
│   ├── favicon-32x32.png              # Standard desktop tab icon
│   ├── apple-touch-icon.png           # iOS touch icon
│   ├── llms.txt                       # Curated markdown profile for LLMs & AI crawlers
│   ├── robots.txt                     # Crawler directives pointing to sitemap-index.xml
│   └── staticwebapp.config.json       # Azure SWA security headers and MIME types
├── src/
│   ├── assets/images/                 # Managed assets processed by Astro's Image engine
│   ├── components/                    # Reusable UI components
│   │   ├── ContactCta.astro           # Friction-free quote form & access checker
│   │   ├── Footer.astro               # Corporate footer, contact desk & legal links
│   │   ├── Hero.astro                 # Above-the-fold hero with eager LCP image
│   │   ├── Navbar.astro               # Sticky light header with root-relative navigation
│   │   └── Services.astro             # 3-card core capability grid matching live services
│   ├── layouts/
│   │   └── Layout.astro               # HTML5 shell, Schema.org JSON-LD, fonts & analytics
│   ├── pages/
│   │   ├── index.astro                # 3-section high-converting landing page
│   │   └── terms-conditions.astro     # 28-clause legal Terms & Conditions contract
│   └── styles/
│       └── global.css                 # Tailwind CSS v4 directives & font declarations
├── astro.config.mjs                   # Astro configuration with sitemap & Tailwind plugins
├── package.json                       # Scripts and project dependencies
├── staticwebapp.config.json           # Root Azure SWA config reference
└── tsconfig.json                      # Strict TypeScript compiler options
```

---

## ☁️ Azure Infrastructure & CI/CD Deployment

The cloud infrastructure is defined as code in [`infra/`](infra/) using HashiCorp Terraform and Azure Verified Modules (`avm-res-web-staticsite`):

- **Target Subscription**: `717cfa33-1524-4715-a9e2-effb12af994d`
- **Tenant Domain**: `garyfleetfuelsco.onmicrosoft.com`
- **Resource Group**: `rg-wmmh-prod` (West Europe)
- **Static Web App**: `stapp-wmmh-prod` (East US 2 control plane, global Anycast edge)
- **Isolation Guarantee**: Dedicated resource group and state isolation ensuring complete separation from other workloads.

### GitHub Actions Deployment Pipeline
The CI/CD pipeline ([`.github/workflows/azure-static-web-apps.yml`](.github/workflows/azure-static-web-apps.yml)) automatically runs on push to `main`:
1. Checks out repository and configures Node.js (`.nvmrc`).
2. Runs `npm ci`, `npx astro check`, and `npm run build`.
3. Deploys optimized static bundle (`dist/`) to Azure Static Web Apps using the repository secret:
   ```bash
   AZURE_STATIC_WEB_APPS_API_TOKEN
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
- **`public/ai-catalog.json` & `public/.well-known/ai-catalog.json`**: Agent Resource Directory (ARD) metadata for autonomous agents.
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
