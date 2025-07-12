#!/bin/bash

# 🕓 Get timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# 🔄 Replace password and write to new file
sed 's/mysqlPass = .*/mysql_psw = REDACTED/' config.lua > bkp_config.lua

# 🧾 Git commit message
commit_msg="[$timestamp] Updating server config"

# 🧩 Git workflow
#git checkout rprado-ot-version
git add bkp_config.lua
git commit -m "$commit_msg"
git push origin rprado-ot-version
