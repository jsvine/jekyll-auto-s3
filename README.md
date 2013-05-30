__Jekyll Auto-S3__ is a simple [Jekyll](http://jekyllrb.com/) [plugin](http://jekyllrb.com/docs/plugins/) that automatically uploads your Jekyll site to Amazon S3. Pair with `jekyll build --watch` or `jekyll serve --watch` for optimal results.

## Getting Started

1) Make sure you've got the requirements:


- [s3cmd](http://s3tools.org/s3cmd) for syncing with S3: [install and configure](http://s3tools.org/s3cmd#howto)

- [Crochet](https://github.com/jsvine/crochet) for hooking into Jekyll: `gem install crochet`

2) Copy [auto-s3.rb](auto-s3.rb) into your Jekyll project's `_plugins/` directory. (If the directory doesn't exist yet, create it.)

3) Add the following lines to your `_config.yml`:

	s3:
		bucket: YOURBUCKETNAME

## Usage

auto-s3.rb will sync your built-site directory (typically `_site/`) with the root folder of the bucket you specify in `_config.yml` every time Jekyll processes/auto-regenerates your site. 

*Note*: auto-s3.rb will __not__ sync with S3 if you've passed Jekyll the `--drafts` flag. That's on purpose.

## Compatibility

Tested with Jekyll 1.0.


