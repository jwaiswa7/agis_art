[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 149a09d..d9424b7 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -38,6 +38,10 @@[m [mgem "sidekiq-unique-jobs", "~> 6.0.25" # Ensures that Sidekiq jobs are unique wh[m
 group :development, :test do[m
   # Call 'byebug' anywhere in the code to stop execution and get a debugger console[m
   gem 'byebug', platforms: [:mri, :mingw, :x64_mingw][m
[32m+[m[32m  # Run against this stable release[m
[32m+[m[32m  gem 'rspec-rails', '~> 5.0.0'[m
[32m+[m[32m  gem 'factory_bot_rails'[m
[32m+[m[32m  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'[m
 end[m
 [m
 group :development do[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 4efd722..d8f89de 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -1,3 +1,11 @@[m
[32m+[m[32mGIT[m
[32m+[m[32m  remote: https://github.com/faker-ruby/faker.git[m
[32m+[m[32m  revision: 08cd44c88f0e5579be557acca4633e25a64ffe55[m
[32m+[m[32m  branch: master[m
[32m+[m[32m  specs:[m
[32m+[m[32m    faker (2.17.0)[m
[32m+[m[32m      i18n (>= 1.6, < 2)[m
[32m+[m
 GEM[m
   remote: https://rubygems.org/[m
   specs:[m
[36m@@ -64,9 +72,15 @@[m [mGEM[m
     concurrent-ruby (1.1.8)[m
     connection_pool (2.2.3)[m
     crass (1.0.6)[m
[32m+[m[32m    diff-lcs (1.4.4)[m
     erubi (1.10.0)[m
     et-orbi (1.2.4)[m
       tzinfo[m
[32m+[m[32m    factory_bot (6.1.0)[m
[32m+[m[32m      activesupport (>= 5.0.0)[m
[32m+[m[32m    factory_bot_rails (6.1.0)[m
[32m+[m[32m      factory_bot (~> 6.1.0)[m
[32m+[m[32m      railties (>= 5.0.0)[m
     ffi (1.15.0)[m
     figaro (1.2.0)[m
       thor (>= 0.14.0, < 2)[m
[36m@@ -138,6 +152,23 @@[m [mGEM[m
     rb-inotify (0.10.1)[m
       ffi (~> 1.0)[m
     redis (4.2.5)[m
[32m+[m[32m    rspec-core (3.10.1)[m
[32m+[m[32m      rspec-support (~> 3.10.0)[m
[32m+[m[32m    rspec-expectations (3.10.1)[m
[32m+[m[32m      diff-lcs (>= 1.2.0, < 2.0)[m
[32m+[m[32m      rspec-support (~> 3.10.0)[m
[32m+[m[32m    rspec-mocks (3.10.2)[m
[32m+[m[32m      diff-lcs (>= 1.2.0, < 2.0)[m
[32m+[m[32m      rspec-support (~> 3.10.0)[m
[32m+[m[32m    rspec-rails (5.0.1)[m
[32m+[m[32m      actionpack (>= 5.2)[m
[32m+[m[32m      activesupport (>= 5.2)[m
[32m+[m[32m      railties (>= 5.2)[m
[32m+[m[32m      rspec-core (~> 3.10)[m
[32m+[m[32m      rspec-expectations (~> 3.10)[m
[32m+[m[32m      rspec-mocks (~> 3.10)[m
[32m+[m[32m      rspec-support (~> 3.10)[m
[32m+[m[32m    rspec-support (3.10.2)[m
     sass-rails (6.0.0)[m
       sassc-rails (~> 2.1, >= 2.1.1)[m
     sassc (2.4.0)[m
[36m@@ -198,12 +229,15 @@[m [mPLATFORMS[m
 DEPENDENCIES[m
   bootsnap (>= 1.4.2)[m
   byebug[m
[32m+[m[32m  factory_bot_rails[m
[32m+[m[32m  faker![m
   figaro[m
   jbuilder (~> 2.7)[m
   listen (~> 3.2)[m
   pg (>= 0.18, < 2.0)[m
   puma (~> 4.1)[m
   rails (~> 6.0.3, >= 6.0.3.5)[m
[32m+[m[32m  rspec-rails (~> 5.0.0)[m
   sass-rails (>= 6)[m
   sidekiq (~> 6.1.2)[m
   sidekiq-cron (~> 1.2)[m
[1mdiff --git a/app/models/ticker.rb b/app/models/ticker.rb[m
[1mindex 4d045f4..1ab092c 100644[m
[1m--- a/app/models/ticker.rb[m
[1m+++ b/app/models/ticker.rb[m
[36m@@ -1,3 +1,6 @@[m
 class Ticker < ApplicationRecord[m
 	SYMBOLS = %w[BTCUSDT ETHUSDT LTCUSDT][m
[32m+[m	[32mvalidates :symbol, presence: true[m
[32m+[m[32m    # validates :symbol, incluson: {in: SYMBOLS }[m
[32m+[m
 end[m
