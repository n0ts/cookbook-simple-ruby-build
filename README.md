cookbook-simple-ruby-build Cookbook
===================================
Build ruby via rbenv + ruby-build, upload rbenv directory to your S3.


Requirements
------------
### Platforms
- Ubuntu


Recipes
----------

- `rbenv_dir` - create rbenv prefix directory
- `default` - default


Attributes
----------
See `attributes/default.rb` for default values.

- `node['simple-ruby-build']['ruby_version']` - install ruby version, default 2.0.0-p247
- `node['simple-ruby-build']['aws_region']` - your S3 region, default us-east-1
- `node['simple-ruby-build']['aws_s3_bucket']` - your S3 bucket name, default simple-ruby-build
- `node['simple-ruby-build']['auto_shutodwn']` - auto vm shutdown, default true


Usage
-----
Use [`berkshelf-ruby-build`](https://github.com/n0ts/berkshelf-ruby-build/).


License and Authors
-------------------
Author:: Naoya Nakazawa (<me@n0ts.org>)
