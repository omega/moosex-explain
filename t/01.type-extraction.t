#!/usr/bin/perl -w

use strict;
use Test::More 0.88;
use MooseX::Explain;

use lib qw(t/lib);

my $xplner = MooseX::Explain->new();

{
    my $tree = $xplner->explain('TestModule1');
    
    is($tree->{type}, "class")
}
{
    my $tree = $xplner->explain('TestRole1');
    is($tree->{type}, 'role');
}
{
    my $tree = $xplner->explain('TestTypeLib1');
    is($tree->{type}, 'typelib');
}
{
    my $tree = $xplner->explain('TestCrap1');
    is($tree->{type}, 'other');
    
}


done_testing();
