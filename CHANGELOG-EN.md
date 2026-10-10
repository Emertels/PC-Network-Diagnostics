# Changelog

## 1.0.0 — 2026-10-09

- Organizes the docs into a PT-BR primary README and a separate English version, with guidance tailored to this project’s options and workflow.

- Updates the run instructions to point directly to the correct project entry point.

- Combines the diagnostic and collector into one .bat, brings the report layout closer to the original, and retains its colors.
- Avoids a generic warning when optional hardware fields are unavailable.

- Improves compatibility with WMI and legacy PowerShell while preferring modern cmdlets when available.
- Fixes system-drive and interface-traffic collection and bounds the public-IP lookup.
- Restores the original numbered report with left-aligned fields and wrapped long values.

- Uses WMI fallbacks when CIM or storage cmdlets are unavailable.
- Bounds the optional public-IP lookup to five seconds and continues if it fails.
- Shows version, session date/time, and translated fields in ten languages.
- Keeps partial reports when hardware does not expose a field.


- Corrects accents and cedilla in interface text and documentation, aligns session headers, and updates agent instructions.

- Usage, dependency, and required-file documentation was reviewed to match current project behavior.

- Aligns the author, projects, and official communities section with the Antigravity reference repository.

- Fixes the diagnostic window title accents in all supported languages.

- Uses an initial capital on each window-title word and lowercase for the remaining letters; the report heading remains uppercase.
