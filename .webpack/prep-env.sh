#! /usr/bin/env bash

# Without this the setup fails silently: a permission error from one of the mkdirs
# below left the test environment half-built, and the suite only failed much later
# with an unexplained ENOENT.
set -e

pwd
echo $NODE_PATH
sudo mkdir -p /home/pi
sudo ln -sfn /home/runner/work/firewalla/firewalla /home/pi/firewalla
sudo ls -l /home/pi/firewalla

# One resolution pass for the whole set. Installing these one at a time made npm
# re-resolve and re-audit the entire ~580 package tree seven times over, which is
# where most of this job's runtime went. mocha is a devDependency and npm scripts
# put node_modules/.bin on PATH, so it no longer needs a separate global install.
npm i \
  nyc@15.1.0 \
  mocha@^9.2.2 \
  jsbn@1.1.0 \
  lru-cache@5.1.1 \
  moment-timezone@0.3.1 \
  muk@0.5.3 \
  async@2.6.4

sudo touch /etc/firewalla-release
sudo bash -c 'cat <<EOF > /etc/firewalla-release
BOARD=gold
BOARD_NAME=gold
BOARD_VENDOR=Firewalla
ARCH=x86_64"
EOF'

# These all resolve through net2/Firewalla.js getUserHome(), i.e. process.env.HOME,
# which is the runner's own home. Assigning HOME here would only rebind it inside this
# script - the test step runs in a fresh shell - so the directories have to be created
# where the tests will actually look for them.
mkdir -p "${HOME}/.firewalla/run/device-detector-regexes"
mkdir -p "${HOME}/.firewalla/config/dnsmasq"
mkdir -p "${HOME}/.forever"
mkdir -p "${HOME}/ovpns"
mkdir -p "${HOME}/logs"
mkdir -p ./coverage
echo "{}" > "${HOME}/.firewalla/license"

# Not every log path goes through getUserHome - these are hardcoded under /home/pi, and
# winston's file transport opens its file at module load without creating the directory,
# so a missing one throws while test files are still being loaded. A throw at that point
# lands in the root "before all" hook, which makes mocha skip the entire run, so one
# absent directory costs every test in the suite rather than a single file.
#
#   /home/pi/logs      util/audit.js (Trace.log), util/accountingAudit.js (Accounting.log)
#   /home/pi/.forever  net2/logger.js getTestTransport (test.log), built whenever NODE_ENV=test
#
# /home/pi is created with sudo above, so hand it to the runner user before adding to it.
sudo chown "$(id -un)" /home/pi
mkdir -p /home/pi/logs
mkdir -p /home/pi/.forever

sudo apt-get install -y redis ipset
