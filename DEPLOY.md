# Deploy &amp; DNS — Midweek Bass Site

Pasteable commands, in order. Replace `PROJECT_ID` with the Firebase project ID
once the new project is created.

## 1. One-time: associate this folder with the Firebase project

```bash
cd /Users/tim/Desktop/midweek-bass-site
firebase use --add PROJECT_ID
```

This writes `.firebaserc` so future deploys know which project to target.
Pick "default" for the alias when prompted.

## 2. Deploy

```bash
firebase deploy --only hosting
```

Firebase prints the live URL when done — typically `https://PROJECT_ID.web.app`.

## 3. Custom domain (orderlamps.com)

In the Firebase console:

1. **Hosting → Add custom domain → enter `orderlamps.com`**
2. Firebase shows a **TXT record** for verification. Add it at GoDaddy:
   - Type: `TXT`
   - Name: `@`
   - Value: (long string Firebase provides)
   - TTL: 1 hour
3. Back in Firebase: click **Verify**. Once verified, Firebase shows two **A records**.
4. Add both at GoDaddy. Delete any conflicting `@` A records first
   (typically GoDaddy's parking page IPs).
5. In Firebase, click **Finish**. The SSL cert provisions in 15&ndash;60 minutes.

After provisioning, also add a `www` redirect:
- Repeat step 1 with `www.orderlamps.com` &mdash; Firebase auto-creates a CNAME
  pointing `www` to the apex.

## Re-deploying later

```bash
cd /Users/tim/Desktop/midweek-bass-site
firebase deploy --only hosting
```

That's it &mdash; no login or init needed once it's set up.
