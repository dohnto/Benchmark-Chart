use Benchmark qw/:all/;
use Benchmark::Chart qw/plotthese/;

sub createSubs {
    my $x = shift;
    return {
        'x * x' => sub { $x * $x },
        'x ^ 2' => sub { $x**2 },
    };
}

# functional interface
my $result = timethese( 20000000, createSubs( 666666666 ), 'none' );
plotthese(
    options => {
        title  => "Single benchmark",
        output => "benchmark1.png",
    },
    data => $result
);

# or if you have more data
my %inputs = (
    '9999999'               => 9999999,
    '88888888888'           => 88888888888,
    '777777777777777777777' => 777777777777777777777,
);

my @results = ();

for my $k ( keys %inputs ) {
    push @results, { $k => timethese( 20000000, createSubs( $inputs{$k} ), 'none' ) };
}

plotthese(
    options => {
        title  => "Benchmark with more data",
        output => "benchmark2.png",
    },
    data => \@results
);


plotthese(
    options => {
        title  => "Uniform benchmark with more data",
        output => "benchmark3.png",
    },
    data => \@results,
    uniform => 1
);
