import requests
import json
import sys

def post2discord(url, message):
    discord_data = {
        "content": message
    }
    response = requests.post(
        url,
        data=json.dumps(discord_data),
        headers={'Content-Type': 'application/json; charset=UTF-8'}
    )
    if response.ok:
        print("Message sent successfully.")
    else:
        print(f"Failed to send message. Status code: {response.status_code}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python post2discord.py <webhook> <message>")
        sys.exit(1)

    webhook = sys.argv[1]
    message = sys.argv[2]

    post2discord(webhook, message)
