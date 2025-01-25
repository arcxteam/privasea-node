# A Comprehensive Guide to Run Privanetix Node (Privasea Node) and WorkHeart USB Node

Whats Privasea? Ink is a Layer 2 blockchain project specifically tailored for DeFi applications built on the Optimism Superchain (OP Stack). Ink by the team behind Kraken, officially known as Payward Inc.

## Here We Go...GAS 

**`Is there incentivized?` ![Confirm](https://img.shields.io/badge/confirm-yes-brightgreen)** 

**`but don't worry read important`**

> [!IMPORTANT]
> currently, there isn't an incentive-basis testnet for Ink, it's worth noting that many Layer 2 projects to release tokenomics and incentives over time. Following these projects can provide insights into potential incentives and benefits down the line, as we’ve seen with other successful L2. **FOR HUGE UPDATES, WILL BE SHARING AT THIS REPO**

![DeepSea-01-26-2025_12_31_AM](https://github.com/user-attachments/assets/81a4ff84-a89f-4ef9-99cc-078bfde7bdee)

---

## 1. Preparation - Run Privasea Node
**1. Hardware Requirements**

`In order to run Ink node, its need a server like VPS with the minimum recommended specs`
| Requirement                      | Details                                   |
|----------------------------------|-------------------------------------------|
| RAM/Memory                       | 4 - 6 GB                                  |
| CPU/vCPU                         | 4 - 6 Cores                               |
| Storage Space                    | 100 GB - More                             |
| Supported OS                     | Ubuntu 20-22-24 w/ amd64 architecture     |
| Docker                           | [Manual Install Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) |

> Not yet Docker install? try auto installing...CMD this
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
