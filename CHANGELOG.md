# Changelog

All changes to this project should be reflected in this document.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [[0.0.3.2]](https://github.com/mod-posh/Post2Bluesky/releases/tag/v0.0.3.2) - 2025-01-21

### Changes

- **Action.yml**: Added `& $env:GITHUB_ACTION_PATH\\` to access the file properly.

---

## [[0.0.3.1]](https://github.com/mod-posh/Post2Bluesky/releases/tag/v0.0.3.1) - 2025-01-21

### Changes

- **Inputs Update**: Added `discordWebhook` as a required input to pass the Discord webhook URL securely.
- **Secret Handling**: Updated the script to use `${{ inputs.discordWebhook }}` instead of referencing `secrets.discordWebhook` directly.
- **Compatibility Fix**: Resolved an issue with composite actions by explicitly passing the webhook URL as an input.
- **Documentation Update**: Adjusted example workflows to reflect the new input structure for `discordWebhook`.

---

## [[0.0.3.0]](https://github.com/mod-posh/Post2Bluesky/releases/tag/v0.0.3.0) - 2025-01-21

### Changes

- **Inputs**: Replaced `source` and `projectName` inputs with a single `message` input for user-provided notification content.
- **Secrets**: Retained `discordWebhook` for securely handling Discord webhook URLs.
- **PowerShell Script**: Simplified to accept `message` and `discordWebhook` parameters. Removed logic for inspecting `.psd1` and `.csproj` files.
- **Debugging**: Added support for a `VERBOSE` environment variable to enable debug output during script execution.
- **Error Handling**: Enhanced error handling to provide meaningful messages while ensuring sensitive data (e.g., webhook URLs) is not exposed.
- **Flexibility**: Decoupled the action from specific project structures, allowing it to be used in any scenario requiring Discord notifications.
- **Documentation**: Updated to reflect the simplified process and new inputs.

---
