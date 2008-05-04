use Module::Build;
my $build = Module::Build->new(
    module_name	=> 'HTML::TextToHTML',
    license		=> 'perl',
    dist_name		=> 'txt2html',
    dist_author		=> 'Kathryn Andersen',
    dist_version_from	=> 'scripts/txt2html',
    requires		=> {
		'perl'	=> '5.8.1',
		'Getopt::Long' => 0,
		'Getopt::ArgvFile' => 0,
		'File::Basename' => 0,
		'Pod::Usage' => 0,
		'YAML::Syck' => 0,
    	},
    build_requires	=> {
		'Test::More' => 0,
		'Module::Build' => 0.26
    	},
    script_files	=> ['scripts/txt2html'],
    create_makefile_pl => 'traditional',
);
$build->create_build_script;
