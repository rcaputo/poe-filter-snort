#!/usr/bin/perl
# $Id$

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
  NAME         => 'POE::Filter::Snort',
  AUTHOR       => 'Rocco Caputo <rcaputo@cpan.org>',
  ABSTRACT     => 'POE stream filter for parsing Snort logs',
  VERSION_FROM => 'Snort.pm',

  PM           => { 'Snort.pm' => '$(INST_LIBDIR)/Snort.pm' },
  PREREQ_PM    => {
    POE        => 0.3101,
    Test::More => 0,
  },
  dist         => {
    COMPRESS   => 'gzip -9f',
    SUFFIX     => 'gz',
    PREOP      => (
      'cvs-log.perl | tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
    ),
  },
);
