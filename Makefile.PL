# $Id: /mirror/youri/soft/Config/trunk/Makefile.PL 2231 2007-03-05T21:43:04.296916Z guillomovitch  $
use ExtUtils::MakeMaker;
use version;

WriteMakefile(
    NAME         => 'Youri::Config',
    VERSION_FROM => 'lib/Youri/Config.pm',
    AUTHOR       => 'Youri project <youri@zarb.org>',
    PREREQ_PM    => {
        'YAML::AppConfig' => 0,
    }
);

sub MY::postamble {
   return <<'EOF';
.PHONY: svntag
SVNPATH = svn+ssh://youri.zarb.org/home/projects/youri/svn/soft/Config

svntag:
	svn copy -m 'new release $(VERSION)'\
		$(SVNPATH)/trunk \
		$(SVNPATH)/tags/release-$(VERSION)

EOF
}
