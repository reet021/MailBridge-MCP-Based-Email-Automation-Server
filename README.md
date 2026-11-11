# MailBridge – MCP-Based Email Automation Server

MailBridge is a Python-based email automation server built using the **Model Context Protocol (MCP)**. It exposes email-sending functionality as callable tools, allowing compatible AI applications to send emails through a simple tool interface.

The server integrates Google OAuth authentication, Gmail SMTP and Docker for secure access and containerized deployment.

## Features

- **MCP Integration:** Exposes email functionality as callable MCP tools.
- **Email Automation:** Sends emails with dynamic recipient, subject and message content.
- **Google OAuth Authentication:** Secures access to the MCP server using Google authentication.
- **Tool Discovery:** Allows compatible MCP clients to discover and execute available tools.
- **Docker Support:** Containerizes the application for consistent deployment.
- **MCP Inspector Testing:** Supports testing of server connectivity and tool execution.

## Tech Stack

- **Language:** Python
- **Protocol:** Model Context Protocol (MCP)
- **Authentication:** Google OAuth 2.0
- **Email Service:** Gmail SMTP
- **Containerization:** Docker
- **Testing:** MCP Inspector

## Project Structure

```text
MailBridge/
│
├── google_mcp_server.py
├── send_email_mcp_server.py
├── requirements.txt
├── Dockerfile
├── .env.example
├── .gitignore
├── .dockerignore
└── README.md
```

## How It Works

1. The MCP server starts with Google OAuth authentication.
2. An authenticated MCP client connects to the server.
3. The client discovers the available tools, including `whoami` and `send_email_tool`.
4. When the email tool is invoked, the server uses Gmail SMTP to send the email.
5. The server returns the execution result to the client.

## Setup and Installation

### 1. Clone the Repository

```bash
git clone https://github.com/reet021/MailBridge-MCP-Based-Email-Automation-Server.git
cd MailBridge-MCP-Based-Email-Automation-Server
```

### 2. Create a Virtual Environment

```bash
python -m venv env
```

Activate it on Windows:

```powershell
.\env\Scripts\Activate.ps1
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables

Create a `.env` file in the project root using `.env.example` as a template.

Configure the following variables:

```env
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
MCP_SERVER_URL=http://localhost:8000
GMAIL_ADDRESS=your_email@gmail.com
GMAIL_APP_PASSWORD=your_gmail_app_password
```

Use your own Google OAuth credentials and Gmail App Password. Never commit your actual `.env` file.

### 5. Run the Server

```bash
python google_mcp_server.py
```

The MCP server will run at:

```text
http://localhost:8000/mcp
```

## Docker Deployment

### 1. Build the Docker Image

```bash
docker build -t mailbridge .
```

### 2. Run the Container

```bash
docker run -d -p 8000:8000 --env-file .env --name mcp_server mailbridge
```

### 3. Check Container Logs

```bash
docker logs -f mcp_server
```

The server will be accessible at:

```text
http://localhost:8000/mcp
```

## Testing with MCP Inspector

MailBridge can be tested using MCP Inspector.

1. Start the Docker container or run the server locally.
2. Launch MCP Inspector:

```bash
npx @modelcontextprotocol/inspector
```

3. Open the Inspector interface, usually at `http://localhost:6274`.
4. Select **Streamable HTTP** as the transport.
5. Enter the MCP server URL:

```text
http://localhost:8000/mcp
```

6. Connect and explore the available tools.
7. Test the email-sending functionality by providing a recipient, subject and message body.

## Security Considerations

- Store credentials in environment variables.
- Never upload `.env` or expose OAuth client secrets and Gmail App Passwords.
- Pass environment variables at container runtime instead of copying credentials into the Docker image.
- Use authenticated access to protect MCP tool execution.

## Future Enhancements

- Support for HTML-formatted emails.
- Email attachments.
- Email templates and scheduling.
- Integration with additional email providers.

## Author

**Avreet Kaur Bhullar**

GitHub: [reet021](https://github.com/reet021)

---

*MailBridge – Connecting AI applications with email automation through MCP.*
