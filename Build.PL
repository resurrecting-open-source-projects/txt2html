
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "convert plain text file to HTML.",
  "dist_author" => [
    "Kathryn Andersen <perlkat\@katspace.org>"
  ],
  "dist_name" => "txt2html",
  "dist_version" => "2.53",
  "license" => "gpl",
  "module_name" => "txt2html",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "File::Basename" => 0,
    "Getopt::Long" => 0,
    "Pod::Usage" => 0,
    "YAML::Syck" => 0,
    "constant" => 0,
    "perl" => "v5.8.1",
    "strict" => 0
  },
  "script_files" => [
    "scripts/txt2html"
  ],
  "test_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::More" => 0,
    "warnings" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
