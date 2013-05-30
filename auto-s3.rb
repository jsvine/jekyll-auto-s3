require "crochet"
require "pty"

module AutoS3
	VERSION = "0.0.1"

	DEFAULTS = {
		"flags" => [
			"--acl-public",
			"--delete-removed"
		],
		"quiet" => false
	}
end
Crochet::Hook.new(Jekyll::Site) do
	# After every time Jekyll calls `site.process`, run this...
	after :process do
		# Compose s3 options from defaults + _config.yml
		s3 = AutoS3::DEFAULTS.merge(config["s3"])
		command = "s3cmd sync #{s3["flags"].join(" ") } #{config["destination"]}/ #{s3["bucket"]}"

		STDERR.write "\nSyncing with S3...\n"

		begin
			PTY.spawn(command) do |stdin, stdout, pid|
				stdin.each { |line| STDERR.write line } unless s3["quiet"]
			end
		rescue PTY::ChildExited
			STDERR.write "s3cmd threw an ERROR!\n"
		end
	end
end
