# Real macOS Sandbox Build

This project cannot turn the macOS `.app` into a Windows `.exe` without rewriting platform layers. The real app must be built on macOS because it depends on SwiftUI, AppKit, Xcode, and GhosttyKit.

The workflow at `.github/workflows/build-real-macos-app.yml` uses a GitHub-hosted `macos-26` runner as the macOS sandbox. It checks out the repo, initializes submodules, runs the same `make build-app` path used by the project, packages the actual built `Prowl.app`, and uploads it as an artifact.

## How to run it

1. Push this repo to a GitHub fork or branch where Actions are enabled.
2. Open **Actions**.
3. Select **build real macOS app**.
4. Click **Run workflow**.
5. Download the artifact named `Prowl-real-macos-app-*`.

The artifact is a real macOS app bundle. It runs on macOS, not Windows. To interact with it from Windows, run it on a Mac or Mac cloud host and connect by remote desktop.
