#!/usr/bin/perl
use strict;
use File::Spec;
use File::Basename;

my $dirname = dirname(File::Spec->rel2abs( $0 ));

my $bundle = "$dirname/bundle"; 

if (-d $bundle) {
  print "$bundle already exists.\n";
} else {
  if (mkdir ($bundle) ) {
    print "creating $bundle\n";
  } else {
    die $!;
  }
}

`git clone https://github.com/VundleVim/Vundle.vim.git $bundle/Vundle.vim`;
