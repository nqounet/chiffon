#!/usr/bin/env perl

use strict;
use warnings;

use Proclet::Declare;

env(
  MOJO_MODE => 'development',
#  MOJO_MODE => 'production',
);

service('navigator', 'ruby -Idata/chiffon-navigator/sinatra data/chiffon-navigator/sinatra/app.rb');# 4567
service('viewer',    'morbo data/chiffon-viewer/script/chiffon_web --listen http://*:4568');

worker(
  navigator => 1,
  viewer    => 1,
);

color;
run;
