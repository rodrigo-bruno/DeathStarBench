#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export LD_LIBRARY_PATH=$script_dir/lib:$LD_LIBRARY_PATH

services=""
services="$services SocialGraphService"
services="$services WriteHomeTimelineService"
services="$services ComposePostService"
services="$services PostStorageService"
services="$services UserTimelineService"
services="$services UrlShortenService"
services="$services UserService"
services="$services MediaService"
services="$services TextService"
services="$services UniqueIdService"
services="$services UserMentionService"
services="$services HomeTimelineService"

for service in $services
do
	echo "Stopping $service ..."
	kill `cat /tmp/$service.pid`
	echo "Stopping $service ... done"
done

