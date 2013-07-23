#!/usr/bin/env perl

use strict;
use warnings;

use Proclet::Declare;

env(
  MOJO_MODE => 'development',
);

service('navigator', 'ruby -Ichiffon-navigator/sinatra chiffon-navigator/sinatra/app.rb');# 4567
service('viewer',    'morbo chiffon-viewer/script/chiffon_web --listen http://*:4568');

worker(
  navigator => 1,
  viewer    => 1,
);

color;
run;
