use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'		=> 'Lingua::Syllable',
    'VERSION_FROM'	=> 'Syllable.pm', # finds $VERSION
    'PREREQ_PM'		=> {
						Lingua::EN::Syllable=>0.01,
						Lingua::Rhyme=>0.071,
    					},
);
