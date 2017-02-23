#!/bin/bash

ssh -p 29418 mcrd3-01.corpnet.asus gerrit gsql -c \" \
SELECT account_group_names.name  \
FROM account_group_members \
INNER JOIN account_group_names ON account_group_members.group_id = account_group_names.group_id \
INNER JOIN accounts ON account_group_members.account_id = accounts.account_id \
WHERE accounts.full_name = \'$@\' \
\"
