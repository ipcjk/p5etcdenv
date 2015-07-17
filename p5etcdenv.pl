#!/bin/env perl

use Etcd;
use Try::Tiny;
die unless @ARGV >= 1;

my $edir = shift; $ETCDDIR =~s!/*$!/!;
my $etcd = Etcd->new({port=>2379, host=> "192.168.22.2" });
my $node;

try {
	$node =  $etcd->get($edir,  recursive => "1")->node;	
}
catch {
	# FixMe? If $ETCD use cache variable or globals
	die "Can't pull things from etcd";
};

foreach(@{$node->nodes}) {
	my($key) = ($_->key);
	$key =~ s!$edir!!;

	if(@ARGV == 0) {
		printf("%s=\"%s\"\n", $key, $_->value);
	}
	else {
		$ENV{$key} = $_->value;	
	}

}

# ... do other things ...
# ... like tomcat update ...
# ... setting active ...

exec(@ARGV) if @ARGV >= 1;

