🚀 Nginx Server Troubleshooting Cheat Sheet
md
Copy
Edit
# 🚀 Nginx Server Troubleshooting Cheat Sheet

## **1. Manually SSH into the Server**
To connect to the server manually, use SSH:
```bash
ssh -i ~/.ssh/tws-terra-key-p ubuntu@<SERVER_PUBLIC_IP>
2. Check Nginx Status
Ensure Nginx is installed and running:

bash
Copy
Edit
sudo systemctl status nginx
If it's inactive or missing:

bash
Copy
Edit
sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
3. Verify Nginx is Listening on Port 80
bash
Copy
Edit
ss -tulnp | grep :80
If missing, edit Nginx config:

bash
Copy
Edit
sudo nano /etc/nginx/sites-available/default
Ensure it has:

nginx
Copy
Edit
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;
    root /var/www/html;
    index index.html index.htm;
    location / {
        try_files $uri $uri/ =404;
    }
}
Restart Nginx:

bash
Copy
Edit
sudo systemctl restart nginx
4. Test Website Locally from Server
bash
Copy
Edit
curl -I http://localhost
If 403 or 404 appears, ensure index.html exists:

bash
Copy
Edit
ls -l /var/www/html/index.html
If missing, create:

bash
Copy
Edit
echo "<h1>Server is working!</h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx
5. Check Firewall (UFW)
bash
Copy
Edit
sudo ufw status
If inactive or missing, allow HTTP:

bash
Copy
Edit
sudo ufw allow 80/tcp
sudo ufw reload
sudo ufw status
6. Verify AWS Security Group Rules
Ensure AWS Security Group allows HTTP (port 80). Go to AWS Console → EC2 → Security Groups → Inbound Rules. Ensure:

yaml
Copy
Edit
Type: HTTP
Protocol: TCP
Port Range: 80
Source: 0.0.0.0/0
7. Test External Website Access
bash
Copy
Edit
curl -I http://<SERVER_PUBLIC_IP>
8. Monitor Incoming Requests
bash
Copy
Edit
sudo tcpdump -i any port 80
9. Check Website in Another Browser
If everything is working in curl but not in your browser, try:

Use a Different Browser (Chrome, Firefox, Edge).
Force Refresh (Ctrl + Shift + R or Cmd + Shift + R on Mac).
Try Incognito Mode (Ctrl + Shift + N or Cmd + Shift + N on Mac).
Clear Browser Cache:
Open Developer Console (F12).
Right-click the reload button → "Empty Cache and Hard Reload".
Final Steps
Restart Nginx:

bash
Copy
Edit
sudo systemctl restart nginx
Check logs for errors:

bash
Copy
Edit
sudo journalctl -xeu nginx
Ensure website files exist:

bash
Copy
Edit
ls -l /var/www/html/index.html
