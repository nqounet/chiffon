#!/usr/bin/env perl
use strict;
use warnings;

use Proclet::Declare;

env(MOJO_MODE                   => 'development',
    MOJO_WEBSOCKET_DEBUG        => 0,
    MOJO_I18N_DEBUG             => 0,
    CHIFFON_WEB_DEBUG           => 1,
    CHIFFON_WEB_INDEX_DEBUG     => 0,
    CHIFFON_WEB_LOGGER_DEBUG    => 0,
    CHIFFON_WEB_NAVIGATOR_DEBUG => 1,
    CHIFFON_WEB_RECIPE_DEBUG    => 0,
    CHIFFON_WEB_SYSTEM_DEBUG    => 0,
    CHIFFON_WEB_RECEIVER_DEBUG  => 0,
    CHIFFON_WEB_EXTERNAL_DEBUG  => 0,
);

service( 'navigator',
    'ruby -Idata/chiffon-navigator/sinatra data/chiffon-navigator/sinatra/app.rb'
);    # 4567
service( 'viewer',
    'morbo --listen http://*:4568 --watch data/chiffon-viewer/lib --watch data/chiffon-viewer/templates --watch data/chiffon-viewer/chiffon-web.conf data/chiffon-viewer/script/chiffon_web'
);

worker( navigator => 1, viewer => 1, );

color;
run;
