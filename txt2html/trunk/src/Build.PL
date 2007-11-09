use Module::Build;
my $build = Module::Build->new(
    module_name	=> 'HTML::TextToHTML',
    dist_name		=> 'txt2html',
    dist_version_from	=> 'scripts/txt2html',
    requires		=> {
		'perl'	=> '5.6.1',
		'Getopt::Long' => 0,
		'Getopt::ArgvFile' => 0,
		'File::Basename' => 0,
		'Pod::Usage' => 0,
		'Data::Dumper' => 0,
    	},
    build_requires	=> {
		'Test::More' => 0,
		'Module::Build' => 0.26
    	},
    script_files	=> ['scripts/txt2html'],
    dist_author		=> 'Kathryn Andersen',
    license		=> 'perl',
);
$build->create_build_script;

# create the Makefile.PL
use Module::Build::Compat;
print "creating Makefile.PL\n";
Module::Build::Compat->create_makefile_pl('passthrough', $build);
