# Clock documentation

This folder contains the multi-page documentation for **Clock**, published at `grafana.com/grafana/plugins/<slug>/docs/<page>`.

## Why multi-page docs

This lets you write Clock's documentation as lightweight markdown pages, Docusaurus-style: one file per topic, each with its own frontmatter, grouped into folders if you need to. No build step and no HTML, just markdown that gets validated for you and rendered on grafana.com. Styling is controlled by Grafana, not by you, so every plugin's docs look and feel consistent across the catalog.

Your plugin's page at `grafana.com/grafana/plugins/<slug>/` has four tabs, each sourced differently:

| Tab           | Source                                                                                                                                                                           |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Overview      | `index.md`                                                                                                                                                                       |
| Installation  | Generated automatically - nothing to write                                                                                                                                       |
| Changelog     | Your plugin's `CHANGELOG.md`                                                                                                                                                     |
| Documentation | This folder, shown once `docsPath` is set and the docs pass validation. Its own landing page is `index.md` again, rendered here as an auto-generated tree of every page below it |

## What to document

Document every feature of the panel. The codemod scaffolded these pages as stubs — fill in each one:

| File                 | Purpose                                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------------------------- |
| `index.md`           | Overview, what the panel does, what problem it solves. See note below — this is not just another docs page. |
| `data-formats.md`    | The data shape the panel consumes; field types and which field plays which role in the visualization.       |
| `options.md`         | Panel-specific options the editor exposes (panel, tooltip, legend) beyond Grafana's standard options.       |
| `examples.md`        | Worked configurations in `dashboard.json` panel format.                                                     |
| `troubleshooting.md` | Real failures users hit, with diagnostic steps.                                                             |

### `index.md` replaces your README on grafana.com

When `docsPath` is set, `index.md` is what grafana.com's **Overview** tab shows instead of your
repository README — not just the docs entry point. Write its Introduction and Features sections as your
plugin's public pitch: the same audience that used to read your README, not fellow contributors. Keep it
free of build badges, contribution notes and other repo-only content; that still belongs in your actual
`README.md`, which no longer appears on the catalog page once `docsPath` is set.

## Preview and validate locally

```bash
npm run docs:serve     # local preview at http://localhost:3001 with live reload
npm run docs:validate  # check for issues before pushing (strict mode)
```

## How docs are published

Multi-page docs are only published when `docsPath` is set in `src/plugin.json`. If it is not set, this folder is ignored by the publishing pipeline.

When `docsPath` is set:

1. The `validate-docs.yml` workflow runs on every PR that touches `docs/**` or `src/plugin.json` — it runs `plugin-docs-cli validate --strict`.
2. On tag push (release), the docs validator runs again as part of the plugin-validator step. Errors at this stage fail the release.
3. On successful validation, `plugin-docs-cli` builds the docs and writes `dist/docs/` — the manifest plus all markdown and image files.
4. `dist/docs/` rides along inside the plugin archive (`.zip`) uploaded to GCS.
5. Grafana's plugin publishing flow syncs the archive to the CDN, then surfaces the docs at `grafana.com/grafana/plugins/<slug>/docs/`.

## How to disable multi-page docs

If you no longer want multi-page docs for this plugin:

1. Remove the `docsPath` field from `src/plugin.json`.
2. Cut a new release. The next deploy publishes the plugin without the docs subtree; existing pages at `grafana.com/grafana/plugins/<slug>/docs/` stop being served once the new version replaces the old one.

You can leave this folder in place — the publishing pipeline ignores it without `docsPath`. Delete it if you want a clean tree.

## AI authoring assistance

You scaffolded this plugin with AI agent skills. Four skills live under your agent loop's skills folder (`.claude/skills/`, `.agents/skills/` or `.cursor/skills/`, depending on the loop you picked):

| Skill                   | Purpose                                                                                                                                              |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `bootstrap-plugin-docs` | One-shot, plugin-wide. Mines README and source files into the scaffolded stubs, detects soft features and proposes additional pages. Run this first. |
| `write-plugin-docs`     | Per-page. Fills a stub page or updates an existing one. Reads the source files implied by the page title and section briefs.                         |
| `review-plugin-docs`    | Reviews docs files for frontmatter compliance, style rules, section-brief cleanup and factual alignment with source.                                 |
| `validate-plugin-docs`  | Runs `npm run docs:validate --json`, applies category-based fixes, iterates up to 3 times.                                                           |

The authoring conventions the skills enforce are documented in [`AGENTS.md`](./AGENTS.md).

### Recommended workflow

**Once, when starting:**

```
/bootstrap-plugin-docs
```

This walks through every scaffolded stub plus any README content and fills them in. Greenfield plugins (no README content) work too — the skill leans on source-code analysis and prompts you for non-source-backed context.

**When adding a new feature later:**

1. Code the feature first (source files, `plugin.json` edits).
2. If the feature warrants a new doc page (e.g. you added a set of preset configurations and want to document them):
   ```
   /write-plugin-docs <docsPath>/<topic>.md
   ```
   The skill catalogs conventional filenames in its step 4 — check there for the right name. If there is no conventional fit, pick a `kebab-case` filename and use it.
3. Update existing pages whose scope changed (e.g. you added a panel option, so `options.md` needs an update):
   ```
   /write-plugin-docs <docsPath>/options.md
   ```
4. Review the diff:
   ```
   /review-plugin-docs
   ```
5. Validate before pushing:
   ```
   /validate-plugin-docs
   ```

**When updating an existing page:**

Run `/write-plugin-docs <page-path>` directly. The skill re-reads the source files implied by the page title and updates content to match.
