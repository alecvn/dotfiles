#!/bin/bash
get_current_floating_nodes = i3-msg -t get_tree | jq '.nodes[] | select(.id=94005890522528) | .nodes[] | select(.id=94005890528976) | .nodes[] | .floating_nodes'

kinda_get_scratch_buffer = i3-msg -t get_tree | jq 'select(.name="__i3_scratch")'
