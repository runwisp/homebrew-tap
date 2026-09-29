# RunWisp Homebrew tap

[RunWisp](https://runwisp.com) replaces crond and supervisord with one binary
that records every run: exit code, duration, and output, with a web UI and a TUI.

```bash
brew install runwisp/tap/runwisp
```

Upgrade with `brew upgrade runwisp`. The formula installs the prebuilt release
binaries for macOS and Linux (x86_64 and arm64).

To start RunWisp at boot, use `runwisp service install`. See the
[documentation](https://docs.runwisp.com/operations/autostart/).

`Formula/runwisp.rb` is generated on every release by
[runwisp/runwisp](https://github.com/runwisp/runwisp/tree/main/packaging).
Edits made here are overwritten.
