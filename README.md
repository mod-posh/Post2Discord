# Post2Discord GitHub Action

## Overview

Post2Discord is a GitHub Action designed to send notifications to Discord social media platform whenever new content is published.

## Requirements

- GitHub repository with GitHub Actions enabled.
- Discord Webhook Url

## Setting Up Secrets

Before using this action, you need to set up the following secrets in your GitHub repository:

- `DISCORD_WEBHOOK_URL`: Discord Webhook URL.

## Setting Up and Using Secrets in GitHub

### What are GitHub Secrets?

GitHub Secrets allow you to store sensitive information in your GitHub repository. These secrets are encrypted and can be used in GitHub Actions workflows without exposing them in your logs.

### Creating Secrets in Your Repository

1. **Navigate to Your Repository**: Go to the GitHub repository where you want to use the action.

2. **Access Repository Settings**: Click on the "Settings" tab of your repository.

3. **Open Secrets Section**: In the left sidebar, click on "Secrets". Here, you will manage all secrets for your repository.

4. **Add a New Secret**:
   - Click on "New repository secret".
   - Enter a name for your secret in the "Name" field. For example, `DISCORD_WEBHOOK_URL`.
   - In the "Value" field, enter the sensitive data or token.
   - Click "Add secret" to save the secret.

### Using Secrets in Your Workflows

To use these secrets in your GitHub Actions workflows, refer to them by their names in the `env` or `with` section of your workflow file. Secrets are referenced using the `${{ secrets.SECRET_NAME }}` syntax.

#### Example Usage

```yaml
jobs:
  notify_discord:
    uses: jeffpatton1971/Post2Discord@v0.0.1.2
    with:
      message: "New blog post published!"
    env:
      DISCORD_WEBHOOK_URL: ${{ secrets.DISCORD_WEBHOOK_URL }}
```

### Best Practices for Secrets

- **Never Hardcode Secrets**: Avoid hardcoding secrets directly in your code or workflow files.
- **Limit Access**: Only grant access to secrets to those who absolutely need it.
- **Audit and Rotate**: Regularly review and update your secrets.

By following these steps, you can securely manage sensitive information for your GitHub Actions.

## Usage

To use this action in your workflow, create a `.yml` file (if you haven't already) in your `.github/workflows` directory in your GitHub repository.

Here's a basic example of how to use this action:

```yaml
name: Blog Update Workflow

on:
  push:
    branches:
      - main

jobs:
  notify_discord:
    uses: jeffpatton1971/Post2Discord@v1
    with:
      message: "New blog post published!"
    secrets:
      DISCORD_WEBHOOK_URL: ${{ secrets.DISCORD_WEBHOOK_URL }}
```

In this example, when you push to the `main` branch, the action will trigger and send a notification to Discord.

## Python Script

The `post2discordy.py` Python script is used by this action to perform the actual notification. It takes the API key, identifier, and the message as input to send the post to Discord.

## Contributing

Contributions to the Post2Discord action are welcome! Please read our contributing guidelines and submit pull requests for any enhancements.

## Support

For support, questions, or feature requests, please open an issue in the GitHub repository.

## License

This project is licensed under the [Gnu GPL-3](LICENSE).
