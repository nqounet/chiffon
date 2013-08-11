#!/usr/bin/env perl
use strict;
use warnings;

use Proclet::Declare;

env(
  MOJO_MODE => 'development',
  CHIFFON_WEB_DEBUG => 1,
  MOJO_I18N_DEBUG => 1,
  CHIFFON_WEB_INDEX_DEBUG => 1,
  CHIFFON_WEB_NAVIGATOR_DEBUG => 1,
  CHIFFON_WEB_RECIPE_DEBUG => 1,
  CHIFFON_WEB_SYSTEM_DEBUG => 1,
);

service('navigator', 'ruby -Idata/chiffon-navigator/sinatra data/chiffon-navigator/sinatra/app.rb');# 4567
service('viewer',    'morbo data/chiffon-viewer/script/chiffon_web --listen http://*:4568 --watch data/chiffon-viewer/lib --watch data/chiffon-viewer/templates');

worker(
  navigator => 1,
  viewer    => 1,
);

color;
run;
