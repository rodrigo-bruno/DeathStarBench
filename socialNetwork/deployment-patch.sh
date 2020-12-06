#!/bin/bash

source deployment

sed -i 's/#JAEGER#/'$backend'/g' config/jaeger-config.yml
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' config/service-config.json
sed -i 's/#SOCIAL-GRAPH-MONGODB#/'$backend'/g' config/service-config.json
sed -i 's/#SOCIAL-GRAPH-REDIS#/'$backend'/g' config/service-config.json
sed -i 's/#WRITE-HOME-TIMELINE-SERVICE#/'$WriteHomeTimelineService'/g' config/service-config.json
sed -i 's/#WRITE-HOME-TIMELINE-RABBITMQ#/'$backend'/g' config/service-config.json
sed -i 's/#HOME-TIMELINE-REDIS#/'$backend'/g' config/service-config.json
sed -i 's/#COMPOSE-POST-SERVICE#/'$ComposePostService'/g' config/service-config.json
sed -i 's/#COMPOSE-POST-REDIS#/'$backend'/g' config/service-config.json
sed -i 's/#USER-TIMELINE-SERVICE#/'$UserTimelineService'/g' config/service-config.json
sed -i 's/#USER-TIMELINE-MONGODB#/'$backend'/g' config/service-config.json
sed -i 's/#USER-TIMELINE-REDIS#/'$backend'/g' config/service-config.json
sed -i 's/#POST-STORAGE-SERVICE#/'$PostStorageService'/g' config/service-config.json
sed -i 's/#POST-STORAGE-MONGODB#/'$backend'/g' config/service-config.json
sed -i 's/#POST-STORAGE-MEMCACHED#/'$backend'/g' config/service-config.json
sed -i 's/#UNIQUE-ID-SERVICE#/'$UniqueIdService'/g' config/service-config.json
sed -i 's/#MEDIA-SERVICE#/'$MediaService'/g' config/service-config.json
sed -i 's/#TEXT-SERVICE#/'$TextService'/g' config/service-config.json
sed -i 's/#USER-MENTION-SERVICE#/'$UserMentionService'/g' config/service-config.json
sed -i 's/#URL-SHORTEN-SERVICE#/'$UrlShortenService'/g' config/service-config.json
sed -i 's/#URL-SHORTEN-MEMCACHED#/'$backend'/g' config/service-config.json
sed -i 's/#URL-SHORTEN-MONGODB#/'$backend'/g' config/service-config.json
sed -i 's/#USER-SERVICE#/'$UserService'/g' config/service-config.json
sed -i 's/#USER-MEMCACHED#/'$backend'/g' config/service-config.json
sed -i 's/#USER-MONGODB#/'$backend'/g' config/service-config.json
sed -i 's/#HOME-TIMELINE-SERVICE#/'$HomeTimelineService'/g' config/service-config.json

sed -i 's/#MEDIA-MONGODB#/'$backend'/g' media-frontend/lua-scripts/get-media.lua
sed -i 's/#MEDIA-MONGODB#/'$backend'/g' media-frontend/lua-scripts/upload-media.lua
sed -i 's/#JAEGER#/'$backend'/g' nginx-web-server/jaeger-config.json
sed -i 's/#HOME-TIMELINE-SERVICE#/'$HomeTimelineService'/g' nginx-web-server/lua-scripts/api/home-timeline/read.lua
sed -i 's/#USER-SERVICE#/'$UserService'/g' nginx-web-server/lua-scripts/api/post/compose.lua
sed -i 's/#TEXT-SERVICE#/'$TextService'/g' nginx-web-server/lua-scripts/api/post/compose.lua
sed -i 's/#UNIQUE-ID-SERVICE#/'$UniqueIdService'/g' nginx-web-server/lua-scripts/api/post/compose.lua
sed -i 's/#MEDIA-SERVICE#/'$MediaService'/g' nginx-web-server/lua-scripts/api/post/compose.lua
sed -i 's/#USER-TIMELINE-SERVICE#/'$UserTimelineService'/g' nginx-web-server/lua-scripts/api/user-timeline/read.lua
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' nginx-web-server/lua-scripts/api/user/follow.lua
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' nginx-web-server/lua-scripts/api/user/get_followee.lua
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' nginx-web-server/lua-scripts/api/user/get_follower.lua
sed -i 's/#USER-SERVICE#/'$UserService'/g' nginx-web-server/lua-scripts/api/user/login.lua
sed -i 's/#USER-SERVICE#/'$UserService'/g' nginx-web-server/lua-scripts/api/user/register.lua
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' nginx-web-server/lua-scripts/api/user/unfollow.lua
sed -i 's/#HOME-TIMELINE-SERVICE#/'$HomeTimelineService'/g' nginx-web-server/lua-scripts/wrk2-api/home-timeline/read.lua
sed -i 's/#USER-SERVICE#/'$UserService'/g' nginx-web-server/lua-scripts/wrk2-api/post/compose.lua
sed -i 's/#TEXT-SERVICE#/'$TextService'/g' nginx-web-server/lua-scripts/wrk2-api/post/compose.lua
sed -i 's/#UNIQUE-ID-SERVICE#/'$UniqueIdService'/g' nginx-web-server/lua-scripts/wrk2-api/post/compose.lua
sed -i 's/#MEDIA-SERVICE#/'$MediaService'/g' nginx-web-server/lua-scripts/wrk2-api/post/compose.lua
sed -i 's/#USER-TIMELINE-SERVICE#/'$UserTimelineService'/g' nginx-web-server/lua-scripts/wrk2-api/user-timeline/read.lua
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' nginx-web-server/lua-scripts/wrk2-api/user/follow.lua
sed -i 's/#USER-SERVICE#/'$UserService'/g' nginx-web-server/lua-scripts/wrk2-api/user/register.lua
sed -i 's/#SOCIAL-GRAPH-SERVICE#/'$SocialGraphService'/g' nginx-web-server/lua-scripts/wrk2-api/user/unfollow.lua
sed -i 's/#JAEGER#/'$backend'/g' nginx-web-server/pages/jaeger-config.json
