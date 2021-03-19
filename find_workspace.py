import sys
import subprocess
import json

# process input
prefix = sys.argv[1]
query_array = sys.argv[2].split(".")
query = query_array[0]
index = ""
if len(query_array) > 1:
 index = query_array[1]
postfix = sys.argv[3]

# get existing workspaces
workspaces_raw = subprocess.run(
    "i3-msg -t get_workspaces", \
    shell=True,
    stdout=subprocess.PIPE
).stdout.decode("utf-8")
workspaces = json.loads(workspaces_raw)

# set default name
name = query

# pick a name if the input is a prefix of the input (priority 1)
names = [w["name"] for w in workspaces if w["name"].startswith(query)]
if len(names) > 0:
    name = sorted(names)[0] + index

# pick a name if the input contains the input (priority 2)
else:
    names = [w["name"] for w in workspaces if query in w["name"]]
    if len(names) > 0:
        name = sorted(names)[0] + index

# print chosen name
print(name)

# setup the command
cmd = "i3-msg '%s%s%s'" % (prefix, name, postfix)
print(cmd)

# run the command
subprocess.run(cmd, shell=True)
