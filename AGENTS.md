# emacs-init

Personal GNU Emacs configuration. The repository is the `init/` layer of an
`~/.emacs.d` tree: `init.el` bootstraps `~/.emacs.d/init/init-main.el`, which
`require`s the many `init-*.el` modules (one per topic/language). There is no
compiled application and no automated test suite — the "app" is Emacs loading
this configuration.

## Cursor Cloud specific instructions

Environment layout (created idempotently by the startup/update script, so it is
already in place for you):

- The repo (`/workspace`) is linked into `~/.emacs.d`:
  - `~/.emacs.d/init` -> repo root (so `~/.emacs.d/init/init-*.el` resolve)
  - `~/.emacs.d/site-lisp` -> repo `site-lisp`
  - `~/.emacs.d/init.el` — tiny bootstrap that loads `~/.emacs.d/init/init.el`
  - `~/.emacs.d/custom.el` — empty `custom-file` (`init-main.el` `load`s it)

Key facts / gotchas:

- Emacs version: this config needs Emacs >= 30.1 (e.g. `kotlin-ts-mode` requires
  30.1). The stock Ubuntu 24.04 package is 29.3, so the environment installs
  Emacs 30.2 from `ppa:ubuntuhandbook1/emacs`. Verify with `emacs --version`.
- Packages auto-install from ELPA/MELPA on first Emacs launch via
  `use-package :ensure t`, into `~/.emacs.d/elpa-<major>.<minor>/`. This needs
  network to `elpa.gnu.org`, `elpa.nongnu.org`, and `melpa.org`. The first
  launch is slow (hundreds of packages); later launches are fast because the
  package dir is cached. Do not add package installation to the startup script.
- `vterm` needs a compiled native module. It is built once (needs `cmake`,
  `libtool`, `libvterm-dev`) to `~/.emacs.d/elpa-*/vterm-*/vterm-module.so`. If
  it is ever missing, opening a vterm buffer prompts to compile it.
- Do NOT verify with `emacs --daemon`. Under a daemon `use-package-always-demand`
  becomes `t`, which force-loads every otherwise-deferred package. Several
  language modes have eager configs that shell out to external toolchains that
  are not installed here (e.g. `racket-mode`'s logger `:set` calls
  `executable-find "racket"` and errors). Plain GUI `emacs` and
  `emacs --batch` keep these packages deferred, so they load cleanly.
- `init.el` sets `debug-on-error t`; any startup error opens a `*Backtrace*`
  buffer (GUI) or aborts with a backtrace (batch).
- Tree-sitter: `init-prog.el` remaps many major modes to their `*-ts-mode`
  variants (e.g. `python-ts-mode`) but does not define
  `treesit-language-source-alist`, so it expects the grammar libraries to be
  present in `~/.emacs.d/tree-sitter/`. They are pre-installed in this
  environment. Emacs 30.2 only supports grammar ABI 13–14 — grammars built from
  the latest upstream `master` are ABI 15 and fail to load with a
  "version-mismatch" / "Cannot activate tree-sitter" warning; install them from
  an ABI-≤14 tag instead (e.g. `tree-sitter-python` `v0.23.6`) via
  `treesit-install-language-grammar`. Without a grammar, the corresponding
  `*-ts-mode` still opens but shows that warning and falls back to basic
  fontification.

Run / verify / lint:

- Run (GUI, dev mode): `emacs` — loads the full config.
- Headless load check: `emacs --batch --load ~/.emacs.d/init.el` — exits 0 and
  prints `loading init-… done.` lines when the config loads cleanly.
- Lint an Emacs Lisp file: `emacs --batch -f batch-byte-compile <file>.el`
  (byte-compile warnings are expected; a non-zero exit means a hard error).
  Interactive linting also runs via `flycheck`/`flymake` (see `init-lint.el`).
