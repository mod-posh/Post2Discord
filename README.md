# Post to Discord GitHub Action

This repository contains a GitHub Action (`post2discord.yml`) and a PowerShell script (`post2discord.ps1) that sends notifications to a Discord channel when a new project version is released. It supports PowerShell modules (.psd1) and C# projects (.csproj).

## Features

- Dynamically determine the version of the project.
- Construct a notification message with links to the project on GitHub and either NuGet or PowerShell Gallery.
- Send the notification message to a specified Discord channel via webhook.

## Usage

### Workflow Setup

The `post2discord.yml` is a reusable GitHub Actions workflow that allows you to trigger it via `workflow_call` from other workflows in your repository.

#### Inputs

- `source`: The path to the project file (either `.psd1` or `.csproj`).
- `projectName`: The name of the project, used in the notification message and to construct the URL to PowerShell Gallery or NuGet.

#### Secrets

- `discordWebhook`: The webhook URL for the Discord channel where notifications will be sent.

### PowerShell Script

The `post2discord.ps1` PowerShell script sends a formatted message to Discord. It determines the project's version and constructs a message based on the project type.

#### Parameters

- `Source`: Path to the project file.
- `ProjectName`: Name of the project.
- `DiscordWebhook`: Discord webhook URL.

### Example Workflow Call

```yaml
jobs:
  call_notify_discord:
    uses: ./.github/workflows/post2discord.yml@main
    with:
      source: 'path/to/projectfile.psd1'
      projectName: 'MyProject'
    secrets:
      discordWebhook: ${{ secrets.DISCORD_WEBHOOK }}
```

## Setup Instructions

1. Store your Discord webhook URL in your repository's secrets as `DISCORD_WEBHOOK`.
2. Call the `post2discord.yml` workflow from your main workflow file, providing the necessary inputs and secrets.

## Error Handling

The script includes basic error handling and will output a simplified error message if it encounters an issue.

## Contributions

Contributions to this project are welcome. Please ensure that you test any changes thoroughly before submitting a pull request.
