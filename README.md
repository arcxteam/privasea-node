# privasea-node
a Comprehensive Guide to Privanetix Node (Privasea Node) and WorkHeart USB Node



- Check for file & rename the keystore file in folder to name **wallet_keystore**

1. **Check the Keystore & Rename**
   - The first command this directory and list the files inside it:
     ```bash
     cd /privasea/config && ls
     ```
   - You will see a list of files in this folder. One of the files you need to find will be the **keystore file**, which typically looks like this:
     ```diff
     + example like: UTC--2025-01-06T06-11-07.485797065Z--f07c3ef23ae7beb8cd8ba5ff546e35fd4b332b34
     ```
   - Once you find the keystore file, you need copy file like; **UTC--2025-01-06T06..xxxxx** to rename it to `wallet_keystore`
     ```bash
     mv ./UTC--2025-01-06T06..xxxxxxxxxxxxxxxxxxx ./wallet_keystore
     ```




```bash
docker run  -d   -v "/privasea/config:/app/config" \
-e KEYSTORE_PASSWORD=123456 \
privasea/acceleration-node-beta:latest
```
