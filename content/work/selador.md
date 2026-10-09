---
title: "selador &mdash; Digital Art on an Obsidian Canvas"
date: 2026-10-08
description: "Designing a silent, distraction-free visual gallery for digital art with zero platform commissions or surveillance."
---

# selador: Digital Art on an Obsidian Canvas

**Website:** [selador.art](https://www.selador.art)  
**Role:** Visual Design, Gallery System, Deployment Architecture  
**Stack:** Custom minimalist theme (`selador-blank`), static build, origin media delivery  

---

### The Visual Problem

Contemporary art portfolio platforms are burdened by two failure modes:
1. Proprietary portfolio builders that enforce cookie notices, watermark overlays, and generic grid templates.
2. Third-party marketplace platforms that take substantial commission cuts and subject visitors to advertising, analytics, and social distraction.

The artist behind selador required a digital gallery that functions like a physical viewing room with dark walls and focused directional lighting: completely silent, respectful of high-resolution image rendering, and distraction-free.

---

### Design Approach

1. **The Deep Obsidian Canvas:** The interface relies on dark charcoal and slate tones, allowing vivid digital artwork to command 100% of the visitor's attention.
2. **Minimalist Navigation:** Navigation elements recede when scrolling, surfacing only essential series titles and provenance notes.
3. **Inter-Catalogue Cross-Referencing:** Selected artwork references the central Nox catalogue cleanly via origin-relative links.

---

### Technical & Privacy Decisions

- **Zero-JavaScript Presentation:** Artwork is loaded with modern native responsive image markup (`srcset`, WebP/AVIF formats), avoiding heavy lightbox libraries that introduce security liabilities.
- **Independence & Commission Freedom:** By hosting on a dedicated static architecture, the artist retains complete independence from algorithmic platforms and third-party fee structures.
- **Privacy-First:** Visitors browse the collection in complete privacy. No analytics tags follow them across the web.

---

[Back to Work](/blog/work/) &middot; [Commission an artist portfolio](/blog/start-a-project/)
