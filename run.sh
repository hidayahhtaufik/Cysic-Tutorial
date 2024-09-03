#!/bin/bash

# Check if the EVM address argument is provided
if [ -z "$1" ]; then
  echo "Usage: sh run.sh <your-evm-address>"
  exit 1
fi

# Set the claim reward address from the first argument
CLAIM_REWARD_ADDRESS=$1

# Remove any existing cysic-verifier directory
rm -rf ~/cysic-verifier

# Create a new cysic-verifier directory
cd ~
mkdir cysic-verifier

# Download the necessary files
curl -L https://cysic-verifiers.oss-accelerate.aliyuncs.com/verifier_linux > ~/cysic-verifier/verifier
curl -L https://cysic-verifiers.oss-accelerate.aliyuncs.com/libzkp.so > ~/cysic-verifier/libzkp.so

# Create the configuration file
cat <<EOF > ~/cysic-verifier/config.yaml
chain:
  endpoint: "testnet-node-1.prover.xyz:9090"
  chain_id: "cysicmint_9000-1"
  gas_coin: "cysic"
  gas_price: 10
claim_reward_address: "$CLAIM_REWARD_ADDRESS"

server:
  cysic_endpoint: "https://api-testnet.prover.xyz"
EOF

# Change directory to the new cysic-verifier directory
cd ~/cysic-verifier/
chmod +x ~/cysic-verifier/verifier

# Create the start script
cat <<EOF > ~/cysic-verifier/start.sh
export LD_LIBRARY_PATH=.:~/miniconda3/lib:\$LD_LIBRARY_PATH
export CHAIN_ID=534352
./verifier
EOF

# Make the start script executable
chmod +x ~/cysic-verifier/start.sh

# Run the start script
~/cysic-verifier/start.sh