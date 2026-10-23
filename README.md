# Aedrax Homebrew Tap

Custom [Homebrew](https://brew.sh) formulae and casks supporting both macOS and Linux.

## How do I install these packages?

Install directly with:

```bash
brew install aedrax/tap/<name>
```

Or tap the repository first and then install by name:

```bash
brew tap aedrax/tap
brew install <name>
```

## Available Packages

### Formulae (CLI / TUI)

| Formula | Platforms | Description | Install Command |
| :--- | :--- | :--- | :--- |
| [`kiro-cli`](Formula/kiro-cli.rb) | macOS (`universal`), Linux (`arm64`, `x86_64`) | Agentic AI CLI assistant (formerly Amazon Q Developer CLI) | `brew install aedrax/tap/kiro-cli` |
| [`mattermoist`](Formula/mattermoist.rb) | macOS (`arm64`, `x64`), Linux (`arm64`, `x64`) | Mattermost TUI client | `brew install aedrax/tap/mattermoist` |

### Casks (GUI Apps)

| Cask | Platforms | Description | Install Command |
| :--- | :--- | :--- | :--- |
| [`logdor`](Casks/logdor.rb) | macOS (`universal`), Linux (`x86_64`) | Log viewer with WebEngine map viewer support | `brew install --cask aedrax/tap/logdor` |
| [`jsontitan`](Casks/jsontitan.rb) | macOS (`universal`), Linux (`x86_64`) | View and search very large JSON files | `brew install --cask aedrax/tap/jsontitan` |

## Updating

Update all tapped packages with standard Homebrew commands:

```bash
brew update
brew upgrade
```

To check if upstream has released a newer version than what is currently in the tap:

```bash
brew livecheck --tap aedrax/tap
```
