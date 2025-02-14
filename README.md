# A Complete Guide - Run Privanetix Node (Privasea Node) & WorkHeart-USB Node

Whats Privasea? **Privasea** is a DePIN network focused on protecting data privacy and security during AI computations. It uses Fully Homomorphic Encryption (FHE) to perform calculations on encrypted data, yielding the same results as with unencrypted data.

## Here We Go...GAS 
**`Is there incentivized testnet?` ![Confirm](https://img.shields.io/badge/confirm-yes-brightgreen)**

| Classification                   | Contributor                    | Details                              | Requirements                  |
|----------------------------------|--------------------------------|--------------------------------------|-------------------------------|
| 1. Privanatix Node               | Run a software-based node      | Handle computational tasks w/ level      | VPS/Dedicated server ![yes](https://img.shields.io/badge/yes-brightgreen)  |
| 2. WorkHeart USB Node            | Run a physical USB device      | Individual need USB-device (~~SOLDOUT~~) | VPS/Dedicated server ![yes](https://img.shields.io/badge/yes-brightgreen)  |
| 3. Privasea App                  | A completed PoH (ImHuman-App)  | Individual Mint a NFT 0.0016ETH + task   | App on iOS or Android ![yes](https://img.shields.io/badge/yes-brightgreen) |

> [!IMPORTANT]
> Incentives and rewards: PRVA tokens are intended to incentivize the network of node contributors and ensure their integrity. "These tokens will serve as incentives for the nodes, encouraging their active participation and contribution to the network." Read [Whitepaper](https://privasea.ai/whitepaper)

> <img src="https://github.com/user-attachments/assets/8dd49f17-867a-40f2-a6da-aa9ce564db74" width="400"> 

![image](https://github.com/user-attachments/assets/681ec593-6844-4f67-bca4-6e809d796ddb)

---

## 1. Preparation - Run Privanatix Node
**1. Hardware Requirements**

`In order to run the Privanatix node, it needs a server like (VPS) with the recommended minimum specs`
| Performance Level       | RAM/Memory     | CPU/vCPU       | Storage     |
|-------------------------|----------------|----------------|-------------|
| 1st Coefficient `x2.0`  | 8 GB           | 16 core        | 100 GB-up   | 
| 2nd Coefficient `x1.5`  | 4 GB           | 8 core         | 100 GB-up   |
| 3rd Coefficient `x1.2`  | 4 GB           | 4 core         | 100 GB-up   | 
| 4th Coefficient `x1.0`  | 4 GB           | 2 core         | 100 GB-up   | 
| Supported OS            | Debian/Ubuntu 20-22-24 x86 arch |
| Docker                  | [Manual Install Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) |

> Rewards are calculated using the following formula: **Weight = Tier Coefficient x Uptime Percentage**

Not yet Docker install? try `CMD` this auto installing...
```
curl sSL https://raw.githubusercontent.com/arcxteam/privasea-node/main/install-latest-docker.sh | bash
```
**2. Configuring Port/Firewall**

Binding public static IP & open TCP port 8181 for the network allow

```bash
sudo ufw allow 8181 && sudo ufw reload
```
- or with ipTables
```
sudo iptables -A INPUT -p tcp --dport 8181 -j ACCEPT
```

## 2. Installation & Run Privanatix Node

**Point-1. Pull the docker image using the following command**

> Will taking pulling download total 9GB file, stay cool

```
docker pull privasea/acceleration-node-beta:latest
```
**Point-2. Create the program running directory and navigate to it**

```
mkdir -p  /privasea/config && cd  /privasea
```
**Point-3. Get the keystore file**

- Use an existing wallet `keystore file` or execute the following command to **generate a new account/wallet**
- Step-1, Im choose **generate a new account/wallet**, follow this command

```
docker run -it -v "/privasea/config:/app/config"  \
privasea/acceleration-node-beta:latest ./node-calc new_keystore
```
- Step-2, Keep **enter anything password for a new key** and submit enter again your password this x2, it'll **generate a new account success!!**
- Step-3, looks like **node address** `0x123456789xxxxxx` SAVE..IT..THIS A YOUR WALLET ADDRESS
- Step-4, looks like **node filename** `UTC--2025-01-06T06..xxxxx` SAVE.....IT
- Step-5, go back to root and command `cd`

![image-01-20-2025_04_24_PM](https://github.com/user-attachments/assets/25cce29b-8b93-4bc5-a06d-5089b0ca8e8b)

**Point-4. Rename a keystore file**

- Step-1, the first command this directory
  ```bash
  cd /privasea/config && ls
  ```
- Step-2, only one files you need to find, which typically looks like this...example
  ```diff
  + example like: UTC--2025-01-06T06-11-07.485797065Z--f07c3ef23ae7beb8cd8ba5ff546e35fd4b332b34
  ```
- Step-3, You need copy file like **UTC--2025-01-06T06..xxxxx** plz remove and replace your UTC--xxxx command this
  ```bash
  mv ./UTC--2025-01-06T06..xxxxxxxxxxxxxxxxxxx ./wallet_keystore
  ```

**Point-5. Go to Dashboard Privanatix Node**

- Step-1, Connect wallet anything your hand on Metamask chosee ARB Sepolia, here [DASHBOARD](https://deepsea-beta.privasea.ai/privanetixNode)
- Step-2, Submit and use the wallet address corresponding to the generate a new account like **node address** on previous **point 3 by step-3**
- Step-3, Look picture below and **set up my node**

![image9997](https://github.com/user-attachments/assets/80f07287-7b89-461b-ac73-6ef5eb60eb45)

**Point-6. Start the Node**

- Step-1, If you can't see getting an error, back to command `cd`
- Step-2, and switch to the program running directory
```
cd /privasea
```
- Step-3, You need replace `123456` from your Keep **enter anything password for a new key** this generate on previous **point 3 by step-2**
- Step-4, Run the node following this command, plz remove and replace `123456` use your password-key
```bash
docker run  -d   -v "/privasea/config:/app/config" \
-e KEYSTORE_PASSWORD=123456 \
privasea/acceleration-node-beta:latest
```

![image999](https://github.com/user-attachments/assets/b9af68c1-c7b0-42ba-99ed-c7e155d6764e)

## 3. Usefull Command Logs

- Check docker running into your sercvice
```bash
docker ps -a
```

- Check the IMAGES/SERCIVCE for Privasea and then replace this `12345` your CONTAINER-ID
```
docker logs -f 12345 --tail=100
```

- Check Command to stop the node:
```bash
docker ps -q --filter "ancestor=privasea/acceleration-node-beta:latest" | xargs --no-run-if-empty docker stop
```
- Or Run the command below; if there is no output, it indicates that the node has been stopped.
```bash
docker ps | grep privasea/acceleration-node-beta:latest
```
