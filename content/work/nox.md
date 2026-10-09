---
slug: "nox"
title: "The Nox house"
summary: "Six websites for one author's several names, and the machinery that keeps them in step."
kind: "Publishing system"
period: "2026–"
status: "Live"
group: "For the house"
weight: 10
featured: true
date: 2026-10-09
stack: ["Hugo", "custom themes", "IPFS hosting via 4EVERLAND", "shell and Python tooling"]
links:
  - label: "arxnox.com"
    url: "https://www.arxnox.com/"
---

Nox is one author writing under several names. Each name has its own site and its own design: [iacula](https://iacula.com/), [lux](https://www.luxvesper.com/), [lorica](https://www.lorica.press/), [yod](https://www.yods.ink/) and [selador](https://www.selador.art/). The house itself lives at [arxnox.com](https://www.arxnox.com/), a catalogue that gathers what the names publish. All six are built and maintained here.

### One source for the writing

Manuscripts do not live in the website repositories. They live in the writer's vault, and each site reads them through symlinks and Hugo module mounts. The site repositories hold the design and the build; the words have a single source of truth, and an edit in the vault is an edit everywhere it appears.

### A house feed that only moves when something changes

After a successful publish, each name's site emits a small index of what it has published. The house compares that index with the copy it last saw. If nothing has changed, nothing happens. If something has, the catalogue rebuilds once, in a queue, so two names publishing on the same afternoon cannot trip over each other. Every newly published address is also handed on for a draft announcement — drafted, not posted; a person still decides.

### Deploys that tell the truth

The sites are static files served over IPFS. The hosting gateway has a habit of dropping the connection after an upload has gone through but before it confirms, which looks exactly like a failure. The deploy script treats that as *unconfirmed* rather than *failed*: it captures what it can, parses defensively and retries with backoff, instead of reporting a false alarm or giving up on a deploy that worked.

### House standards

Every site in the house has a light and a dark mode, the same reading controls (text size, back to top), images capped by height so portrait and square works sit at the same scale, and no analytics, trackers or third-party fonts.
