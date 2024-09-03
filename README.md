# Cysic Incentivized Testnet Phase 1 Verifier Setup

This guide will walk you through setting up a verifier node for the Cysic Incentivized Testnet Phase 1. Follow the instructions below to configure and run the verifier on your VPS.

## Prerequisites

- A VPS (Virtual Private Server) with Linux OS
- A registered Cysic Testnet account (Whitelist required)
- An EVM-compatible wallet address for reward claims

## Steps to Set Up the Verifier

1. **Download the setup script and set permissions:**

   First, you'll need to download the setup script from the repository and make it executable.

   ```bash
   wget https://raw.githubusercontent.com/hidayahhtaufik/Cysic-Verifier-Tutorial/master/run.sh && chmod +x run.sh

2. **Run the setup script:**

    Execute the script by providing your EVM wallet address as an argument. This address will be used to claim rewards.

    ```bash
   sh run.sh <YOUR-EVM-ADDRESS>

2. **Wait for the verifier to start:**

    After running the script, the verifier will start, and it may take 15–20 minutes for the block process to begin. Make sure to monitor the logs to ensure everything is running smoothly.

