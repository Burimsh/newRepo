#!/bin/bash

groupadd dev 2>/dev/null
groupadd ops 2>/dev/null

useradd -m -G dev alice 2>/dev/null
useradd -m -G dev bob 2>/dev/null
useradd -m -G ops charlie 2>/dev/null

mkdir -p /lab/{dev,ops,public}

chown root:dev /lab/dev
chmod 2770 /lab/dev

chown root:ops /lab/ops
chmod 2770 /lab/ops

chmod 1777 /lab/public

echo "Lab environment created successfully."
