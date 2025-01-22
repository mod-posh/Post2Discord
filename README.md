# Post to Discord GitHub Action

This repository contains a GitHub Action (`post2discord.yml`) and a PowerShell script (`post2discord.ps1`) that sends notifications to a Discord channel. The message to be posted is provided as input to the action, making it flexible for various use cases.

## Features

- Accepts a custom message to post to Discord, allowing for flexible notifications.
- Sends the provided message to a specified Discord channel via webhook.

## Usage

### Workflow Setup

The `post2discord.yml` is a reusable GitHub Actions workflow that allows you to trigger it via `workflow_call` from other workflows in your repository.

#### Inputs

- `message`: The custom message to post to Discord.

#### Secrets

- `discordWebhook`: The webhook URL for the Discord channel to send notifications to.

### PowerShell Script

The `post2discord.ps1` PowerShell script sends the provided message to Discord via the webhook URL.

#### Parameters

- `Message`: The custom message to post to Discord.
- `DiscordWebhook`: The Discord webhook URL.

### Example Workflow Call

```yaml
name: Post to Discord Example

on:
  push:

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - name: Notify Discord
        uses: mod-posh/Post2Discord@v0.0.3.0
        with:
          message: 'A new update has been released!'
          discordWebhook: ${{ secrets.DISCORD_WEBHOOK }}
```

### Passing a Dynamic Message

You can dynamically construct the message in your calling workflow using GitHub environment variables or other inputs:

```yaml
name: Post to Discord Dynamic Example

on:
  push:

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - name: Notify Discord
        uses: mod-posh/Post2Discord@v1
        with:
          message: |
            🚀 A new version of ${{ github.event.repository.name }} has been released!
            Visit: ${{ github.event.repository.html_url }}
          discordWebhook: ${{ secrets.DISCORD_WEBHOOK }}
```

## Setup Instructions

1. **Add Discord Webhook to Secrets**:
   Store your Discord webhook URL in your repository's secrets as `DISCORD_WEBHOOK`.

2. **Use the Action**:
   Add the `Post2Discord` action to your workflows and provide the `message` input and `discordWebhook` secret.

## Error Handling

- **Debugging**: Set the `VERBOSE` environment variable to `verbose` in your workflow or runner environment to enable additional debug output.
- **Error Messages**: The script provides basic error messages if issues occur during execution.

## Contributions

Contributions to this project are welcome. Please ensure that you test any changes thoroughly before submitting a pull request.
