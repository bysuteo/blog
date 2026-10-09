---
title: "iacula &mdash; The End of Ages Archive"
date: 2026-10-08
description: "Author platform and world-lore archive for an epic fantasy cycle sixteen years in the making."
---

# iacula: The End of Ages Archive

**Website:** [iacula.com](https://iacula.com)  
**Role:** Author Architecture, Multi-Volume Lore Structuring, Reader Experience  
**Stack:** Hugo custom theme (`iacula-blank`), dual content mounts, RSS feeds, static distribution  

---

### The Visual Problem

*The End of Ages* is a four-book epic fantasy cycle developed over sixteen years. Author websites for extensive fantasy fiction frequently struggle to balance promotional publication announcements with the deep lore, histories, and world documentation demanded by devoted readers.

The brief called for an author platform that speaks from within the world itself: scholarly, atmospheric, and capable of housing extensive lore volumes alongside publication dates and book purchase channels.

---

### Design Approach

1. **Atmospheric Dark Typography:** Deep, rich background tones paired with classical editorial type and custom insignia branding.
2. **Dual-Tier Information Architecture:**
   - *The Chronicler:* In-world histories, annals, and lore documentation.
   - *The Work:* Direct book listings, publication announcements, and bookseller links.
3. **Reader Comfort:** Generous measure, comfortable line-height, and zero intrusive popups or disruptive floating bars.

---

### Technical & Privacy Decisions

- **Modular Mounts:** Built with Hugo modular mounts, separating author dispatch writing (`cargo/iacula/chronicler`) from book production records (`cargo/iacula/iacula`).
- **Complete Client Ownership:** All lore entries, draft essays, and book pages exist as portable Markdown text. The author owns every paragraph without vendor capture.
- **Robustness:** Zero moving database parts. The platform handles traffic spikes during book launches without crashing or incurring unpredictable hosting tiers.

---

[Back to Work](/blog/work/) &middot; [Commission an author platform](/blog/start-a-project/)
