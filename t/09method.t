#!/usr/bin/perl

package My::Package;
use Test::More tests => 3;

sub foo { "bar" }

##########################################################

package My::Subclass;
use base qw(My::Package);
use Test::Exception;
use Sub::Attempts;

dies_ok  { attempts("foo"); };
lives_ok { attempts("foo", method => 1) };

##########################################################

package main;
use Test::More;

is(My::Subclass->foo,"bar","and it's full of stars");

