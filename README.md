# A Complete Guide Run Privanetix Node (Privasea Node) and WorkHeart USB Node

Whats Privasea? **Privasea** is a DePIN network focused on protecting data privacy and security during AI computations. It uses Fully Homomorphic Encryption (FHE) to perform calculations on encrypted data, yielding the same results as with unencrypted data.

## Here We Go...GAS 
**`Is there incentivized testnet?` ![Confirm](https://img.shields.io/badge/confirm-yes-brightgreen)**

| Classification                   | Contributor                    | Details                              | Requirements                  |
|----------------------------------|--------------------------------|--------------------------------------|-------------------------------|
| 1. Privanatix Node               | Run a software-based node      | Handle computational tasks w/ level      | VPS/Dedicated server ![yes](https://img.shields.io/badge/yes-brightgreen)  |
| 2. WorkHeart USB Node            | Run a physical USB device      | Individual need USB-device (~~SOLDOUT~~) | VPS/Dedicated server ![yes](https://img.shields.io/badge/yes-brightgreen)  |
| 3. Privasea App                  | A completed PoH (ImHuman-App)  | Individual Mint a NFT 0.0016ETH + task   | App on iOS or Android ![yes](https://img.shields.io/badge/yes-brightgreen) |

> [!IMPORTANT]
> Incentives and rewards: PRVA tokens are intended to incentivize the network of node contributors and ensure their integrity. "These tokens will serve as incentives for the nodes, encouraging their active participation and contribution to the network." Read [Whitepaper](https://privasea.ai/whitepaper)  <img src="https://github.com/user-attachments/assets/8dd49f17-867a-40f2-a6da-aa9ce564db74" width="400"> **FOR HUGE UPDATES, BE SHARING AT THIS REPO**

![DeepSea-01-26-2025_12_31_AM](https://github.com/user-attachments/assets/81a4ff84-a89f-4ef9-99cc-078bfde7bdee)

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

Not yet Docker install? try auto installing...CMD this
```
curl sSL https://raw.githubusercontent.com/arcxteam/privasea-node/main/install-latest-docker.sh | bash
```

![image-01-20-2025_04_24_PM](https://github.com/user-attachments/assets/25cce29b-8b93-4bc5-a06d-5089b0ca8e8b)

![image9997](https://github.com/user-attachments/assets/80f07287-7b89-461b-ac73-6ef5eb60eb45)

![image999](https://github.com/user-attachments/assets/b9af68c1-c7b0-42ba-99ed-c7e155d6764e)



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
