#!/bin/bash

# Copyright 2015-2016 F5 Networks Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOGGER_CMD="logger -t $LOGGER_TAG"

function log() {
  echo "$1" | eval "$LOGGER_CMD"
}

# check if MCP is running
# param 1: Number of retries to perform
# param 2: Interval to wait between retries.
function wait_mcp_running() {
    local failed=0
    local retries=$1
    local interval=$2

    while true; do
    mcp_started=$(bigstart_wb mcpd start)

    if [[ $mcp_started == released ]]; then
        # this will log an error when mcpd is not up
        tmsh -a show sys mcp-state field-fmt | grep -q running

        if [[ $? == 0 ]]; then
        log "Successfully connected to mcpd..."
        return 0
        fi
    fi

    failed=$(($failed + 1))

    if [[ $failed -ge $retries ]]; then
        log "Failed to connect to mcpd after $failed attempts, quitting..."
        return 1
    fi

    log "Could not connect to mcpd (attempt $failed/$retries), retrying in $interval seconds..."
    sleep $interval
    done
}

function main() {

    # Wait for process settings
    local STATUS_CHECK_RETRIES=20
    local STATUS_CHECK_INTERVAL=10

    start=$(date +%s)
    log "Starting hostname auto-configuration..."


        # ensure that mcpd is started and alive before doing anything
        # try 20 times with a 10 second wait between attempts
        wait_mcp_running $STATUS_CHECK_RETRIES $STATUS_CHECK_INTERVAL
        if [[ $? == 0 ]]; then

            # Wait for mcpd to be ready to serialize, 20 sec to accomodate a very slow VE
            sleep 20

            #SPECIFY HERE THE HOSTNAME THAT SHOULD BE USED
            tmsh modify sys global-settings hostname bigip-a.f5.local

            # Save config
            tmsh save sys config | eval $LOGGER_CMD

        else
            log "Cannot setup hostname when MCPD in not running, quitting..."
        fi


}

main &
