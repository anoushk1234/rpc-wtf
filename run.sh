# change entrypoint to testnet or mainnet or whatever if needed
#  --no-snapshot-fetch \
# --no-genesis-fetch \
# these two above commands are required if you already have a snapshot otherwise REMOVE THEM else it wont work

ls /home/solana/.local/share/solana/install/active_release/bin/solana-validator \
--identity ./test-keypair.json \
  --vote-account ./test-keypair.json \
  --rpc-port 8899 \
  --entrypoint entrypoint.devnet.solana.com:8001 \
  --limit-ledger-size \
  --no-voting \
  --no-os-network-limits-test \
  --minimal-snapshot-download-speed 100000000 \
  --skip-poh-verify \
  --no-snapshot-fetch \
  --no-genesis-fetch \
  --no-poh-speed-test \
  --full-rpc-api \
  --enable-rpc-transaction-history \
  --log solana-validator.log \
  --accounts /mnt/accounts \
  --ledger /mnt/ledger \
  --snapshots /mnt/snapshots
