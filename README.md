# Aedrax Homebrew Tap

Custom [Homebrew](https://brew.sh) formulae and casks.

## How do I install these formulae?

Install directly with:

```bash
brew install aedrax/tap/<formula>
```

Or tap the repository first and then install by name:

```bash
brew tap aedrax/tap
brew install <formula>
```

## Available Formulae

| Formula | Description | Install Command |
| :--- | :--- | :--- |
| [`kiro-cli`](Formula/kiro-cli.rb) | Agentic AI CLI assistant (formerly Amazon Q Developer CLI) | `brew install aedrax/tap/kiro-cli` |

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
