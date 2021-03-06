package Sah::Schema::cryptoexchange::account;

# AUTHORITY
# DATE
# DIST
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
    'x.perl.coerce_rules' => ['From_str::normalize_cryptoexchange_account'],
    examples => [
        {
            summary => 'Invalid account syntax',
            value   => 'indodax/a b',
            valid   => 0,
        },
        {
            summary => 'Account too long',
            value   => 'indodax/'.('a' x 65),
            valid   => 0,
        },
        {
            summary => 'Unknown cryptoexchange',
            value   => 'foo/acc1',
            valid   => 0,
        },
        {
            summary => 'Valid',
            value   => 'indodax',
            valid   => 1,
            validated_value => 'indodax/default',
        },
    ],
}, {}];

1;
# ABSTRACT:
