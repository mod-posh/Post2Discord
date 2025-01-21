# Changelog

All changes to this project should be reflected in this document.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [[0.0.3.0]](https://github.com/mod-posh/Post2Bluesky/releases/tag/v0.0.3.0) - 2025-01-21

Here’s a concise list of changes for your changelog:

---

### Changes

- **Inputs**: Replaced `source` and `projectName` inputs with a single `message` input for user-provided notification content.
- **Secrets**: Retained `discordWebhook` for securely handling Discord webhook URLs.
- **PowerShell Script**: Simplified to accept `message` and `discordWebhook` parameters. Removed logic for inspecting `.psd1` and `.csproj` files.
- **Debugging**: Added support for a `VERBOSE` environment variable to enable debug output during script execution.
- **Error Handling**: Enhanced error handling to provide meaningful messages while ensuring sensitive data (e.g., webhook URLs) is not exposed.
- **Flexibility**: Decoupled the action from specific project structures, allowing it to be used in any scenario requiring Discord notifications.
- **Documentation**: Updated to reflect the simplified process and new inputs.

---
