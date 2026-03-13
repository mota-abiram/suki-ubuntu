# Sharing your Project Locally

To let others see your work, you have two main options:

## Option 1: Share on your Local Network (Wifi)
This is best if people are in the same building as you.

1.  Open your terminal in the project folder.
2.  Run this command:
    ```bash
    npx serve .
    ```
3.  Look for the **"On Your Network"** URL (e.g., `http://192.168.1.##:3000`).
4.  Send that link to anyone on the same Wifi.

---

## Option 2: Share over the Internet (Worldwide)
This is best if you want to send a link to someone far away.

1.  First, start your server:
    ```bash
    npx serve .
    ```
2.  Open a **second** terminal window in the same folder.
3.  Run this command to create a public link:
    ```bash
    npx localtunnel --port 3000
    ```
4.  It will give you a URL like `https://short-word-here.loca.lt`.
5.  **Important:** When the person opens the link, they will see a security page. They just need to click "Click to Continue" or enter your public IP.

---

## Quick Shortcuts
I've added these to your `package.json`:
- `npm start` - Starts the local server.
- `npm run share` - Starts the public tunnel.
