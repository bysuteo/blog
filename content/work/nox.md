---
title: "Nox &mdash; Architecture for a Literary House"
date: 2026-10-08
description: "How infinave designed and engineered an uncompromising, privacy-clean publishing house catalogue for multiple author imprints."
---

# Nox: Architecture for a Literary House

**Website:** [arxnox.com](https://www.arxnox.com)  
**Role:** Design, Information Architecture, Static Engineering  
**Stack:** Bespoke Hugo architecture, Markdown ledger, Custom RSS feeds, Zero runtime dependencies  

---

### The Visual Problem

Nox is the central publishing house representing several distinct writing voices and genres. Most multi-author or publishing websites resemble cluttered ecommerce stores or generic blog feeds: rotating hero banners, newsletter popups, cookie consent overlays, and complex content management systems that slow down page delivery.

The directive for Nox required the opposite:
- The feeling of an austere, private archival library or monastic ledger.
- Clean separation across multiple author imprints without fragmenting the house identity.
- Extreme reading comfort with high typographic contrast.
- Zero maintenance overhead and zero third-party surveillance scripts.

---

### Design Approach

We stripped away all conventional marketing chrome:

1. **Typographic Brutalism:** Monochromatic palette (deep black, crisp off-white, subtle slate lines) with strict hierarchy. The type does all the visual work.
2. **Ledger Structure:** Content is organized into a formal `catalogue` and chronological `ledger`. Each book, imprint, and dispatch sits within an orderly, structured taxonomy.
3. **Restrained Motion & Zero Bloat:** No external JavaScript frameworks, no heavy slider libraries. Page transitions are instant, and documents render natively.

---

### Technical & Privacy Decisions

- **Direct Markdown Mounts:** Nox mounts its publishing ledger directly from local markdown records. When an entry is approved, the site builds statically in milliseconds.
- **Custom House Feeds:** Rather than relying on third-party feed aggregators, we implemented custom XML output formats (`HouseFeed`) that syndicate publications cleanly to readers.
- **Absolute Privacy Default:** Zero trackers, zero analytics pixels, zero CDN font queries. Fonts and assets are served directly from the hosting origin.
- **Full Ownership:** The entire house catalogue exists as plain Markdown files and Git version history. It cannot be locked into or retired by a proprietary CMS platform.

---

[Back to Work](/work/) &middot; [Commission a publication system](/start-a-project/)
