FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY .env ./.env
COPY google_mcp_server.py ./google_mcp_server.py
COPY send_email_mcp_server.py ./send_email_mcp_server.py


EXPOSE 8000
CMD [ "python","google_mcp_server.py"]