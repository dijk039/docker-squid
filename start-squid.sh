#!/bin/sh

set -e

xCHOWN=$(/usr/bin/which chown)
xSQUID=$(/usr/bin/which squid)

# Ensure permissions are set correctly on the Squid cache + log dir.
"${xCHOWN}" -R squid:squid /var/cache/squid
"${xCHOWN}" -R squid:squid /var/log/squid

# Prepare the cache using Squid.
echo "Initializing cache..."
"${xSQUID}" -z

# Give the Squid cache some time to rebuild.
sleep 5

# Launch squid
echo "Starting Squid..."
exec "${xSQUID}" -NYCd 1
