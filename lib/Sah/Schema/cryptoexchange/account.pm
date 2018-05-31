package Sah::Schema::cryptoexchange::account;

# DATE
# VERSION

our $schema = [str => {
    summary => 'Account at a cryptocurrency exchange',
    description => <<'_',

The format of this data is "<cryptoexchange>/<account>" where "<cryptoexchange>"
is the name of cryptoexchange (can be code, name or safename, but will be
normalized to its safename) and <account> is account nickname in the
cryptoexchange and must match /\A[A-Za-z0-9_-]+\z/. The "/<account>" part is
optional and will be assumed to be "/default" if not specified.

_
    'x.completion' => 'cryptoexchange_account',
    'x.perl.coerce_rules' => ['str_normalize_cryptoexchange_account'],
}, {}];

1;
# ABSTRACT:
