Nextcloud Talk Alert Script

A PowerShell script that sends alert messages to Nextcloud Talk chats or channels via webhook.
🚀 Features

    Send messages to Nextcloud Talk conversations

    Simple command-line interface

    Basic authentication support

    Error handling with exit codes

📋 Prerequisites

    PowerShell 5.1 or newer

    Nextcloud instance with Talk app enabled

    Nextcloud user account with app password

⚙️ Setup
1. Get Nextcloud Talk Webhook URL

    Go to your Nextcloud Talk app

    Open the desired conversation (group chat or channel)

    Copy the conversation token from:

        Conversation info → "Conversation token"

        Or from URL: .../call/YOUR_CONVERSATION_TOKEN

2. Create App Password

    Nextcloud Settings → Security → Devices & sessions

    Create new app password

    Copy the generated password (it won't be shown again)

3. Configure Script

Edit these variables in the script with your values:
powershell

$webhookUrl = "https://your-nextcloud.com/ocs/v2.php/apps/spreed/api/v1/chat/YOUR_TOKEN"
$username = "your-username"
$appPassword = "your-app-password"

🎯 Usage
Basic Usage
powershell

.\nextcloud-alert.ps1 -alertMessage "Hello from PowerShell!"

From Command Line
powershell

powershell -File "nextcloud-alert.ps1" -alertMessage "Task completed"

With Dynamic Content
powershell

$message = "Server alert at $(Get-Date)"
.\nextcloud-alert.ps1 -alertMessage $message

💡 Examples
System Monitoring
powershell

# High CPU alert
$cpu = (Get-Counter "\Processor(_Total)\% Processor Time").CounterSamples.CookedValue
if ($cpu -gt 90) {
    .\nextcloud-alert.ps1 -alertMessage "🚨 High CPU: $([math]::Round($cpu, 2))%"
}

Backup Notifications
powershell

.\nextcloud-alert.ps1 -alertMessage "✅ Backup completed successfully"

Service Monitoring
powershell

$service = Get-Service -Name "MyService"
if ($service.Status -ne "Running") {
    .\nextcloud-alert.ps1 -alertMessage "🔴 MyService is not running!"
}

🔒 Security Note

Never commit the script with actual credentials. Use environment variables or external configuration for production use.
❓ Troubleshooting

    401 Error: Check username and app password

    404 Error: Verify webhook URL and conversation token

    Connection issues: Ensure Nextcloud server is accessible

📝 License

MIT License - feel free to use and modify as needed.

Note: Remember to configure the script variables before use!
