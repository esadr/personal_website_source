# Ehsan SadrFaridpour — personal website source

This repository contains the Hugo/Hugo Blox source for
[ehsan.faridpour.com](https://ehsan.faridpour.com). The generated site is
published from the adjacent `esadr.github.io` repository.

## Requirements

- Git
- Go (required by Hugo modules)
- Hugo Extended 0.135.0 (the version pinned in `hugoblox.yaml`)

The helper script rejects incompatible Hugo versions so framework upgrades are
intentional and testable.

## Local development

```bash
./view.sh
```

To use a Hugo binary in a nonstandard location:

```bash
HUGO_BIN=/path/to/hugo ./view.sh
```

## Production build

```bash
./scripts/hugo.sh --minify
```

## Deploy

The deployment repository must exist at `../esadr.github.io` and have a clean
working tree. The script builds into a temporary directory, validates the
target repository, preserves `CNAME`, synchronizes generated files, and creates
a deployment commit.

```bash
./deploy.sh "Describe the website update"
```

Pass `--push` as the second argument only when the generated commit should be
pushed immediately:

```bash
./deploy.sh "Describe the website update" --push
```
