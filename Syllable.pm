package Lingua::Syllable;
our $VERSION = "0.02";
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw();
our @EXPORT_OK = qw(&syllable_count);
our %EXPORT_TAGS = ( 'all' => [ qw(
	&syllable_count
) ] );

=head1 NAME

Lingua::Syllable - attempt to return number of syllables in a word

=head1 DESCRIPTION

Pulls in two modules in an attempt to find the number of syllables in an (English) word.

=head1 PREREQUISITES

	Lingua::EN::syllable;
	Lingua::Rhyme;

=cut

use Lingua::EN::syllable;
use Lingua::Rhyme;

=head1 FUNCTION

=head2 &syllable_count ($word)

Returns the number of syllables thought to be in a word, or C<undef>.

Uses Lingua::EN::Rhyme if there is no entry in the Rhyming Dictionary
available through Lingua::Rhyme.

=cut

sub syllable_count { my ($word) = (shift);
	warn "syllable_count requires a scalar word to look up!" unless defined $word;
	if ($word =~ /^(a|the)$/i){
		$_ = 1;
	}
	elsif ($_ = Lingua::Rhyme::syllable($word) ){
		$_ = $_
	} elsif ($word =~ s/'s$//i){
			$_ = Lingua::Rhyme::syllable($word);
			$word .= "'s";
	} else {
		$_ = Lingua::EN::Syllable::syllable($word)
	}
	return $_;
}



=head1 SEE ALSO

L<Lingua::EN::Syllable>;
L<Lingua::Rhyme>;
perl(1).

=head1 AUTHOR

Lee Goddard <lgoddard@cpan.org>

=head1 COPYRIGHT

Copyright (C) Lee Goddard, 2001.

This software is supplied, and may be used, under the same terms as Perl itself.
