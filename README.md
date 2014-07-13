USAGE

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

![benchmark1](http://www.dohnalek.name/perl/Benchmark-Chart/benchmark1.png "benchmark1")

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

![benchmark2](http://www.dohnalek.name/perl/Benchmark-Chart/benchmark2.png "benchmark2")

    plotthese(
        options => {
            title  => "Uniform benchmark with more data",
            output => "benchmark3.png",
        },
        data => \@results,
        uniform => 1
    );

![benchmark3](http://www.dohnalek.name/perl/Benchmark-Chart/benchmark3.png "benchmark3")

INSTALLATION

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install

SUPPORT AND DOCUMENTATION

After installing, you can find documentation for this module with the
perldoc command.

    perldoc Benchmark::Chart

You can also look for information at:

    Github
        https://github.com/dohnto/Benchmark-Chart


LICENSE AND COPYRIGHT

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
Version 2, December 2004

Copyright (C) 2014 Tomas Dohnalek <dohnto@gmail.com> 

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

0. You just DO WHAT THE FUCK YOU WANT TO.
