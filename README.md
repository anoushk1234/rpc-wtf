# rpc-wtf
bunch of scripts to setup rpc node so u dont pull your hair our saying wtf

considering you have an s3 large this shud work, if you have lesser either reduce ramdisk space or just move to ssd folders

### Get started

- cd into your rpc node directory
- compile using cargo r -r
- change the username and folder name of your rpc node in run.sh
  for example my user is debian and folder name is solana-rpc-node so the full path will be `/home/debian/solana-rpc-node/target/release/solana-validator`
- create a keypair using solana-keygen new -o keypair-name.json and then add the filename in run.sh
- thats it then just run setup.sh and then run.sh

## monitor your node
- solana-validator --ledger /mnt/ledger
- tail -f solana-validator.log
- df -h to watch disk space
