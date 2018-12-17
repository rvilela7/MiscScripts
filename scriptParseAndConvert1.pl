# Parses an idented file and converts minutes to hours, with sum for first level of identation

#e.g.:

# 1. Starting at FG - 60m
# 2. Tutorial NodeJS
# - Reading about JS library - 115m
# - Hello world -5m
# *Dev Package
# 1.Understanding application context and requirements
# - Knowledge of the repository - 120m
# - Understanding class in nodejs and structure -120m

use strict;
my $sum = 0;
while(<>){
    chomp;

    if (m/^\d/)
    {
        printf ("~~%.2f~~\n", $sum);
        $sum = 0;
    }
    if (m/(\d+)m/)
    {
        my $v = int($1) / 60;
        my $a = sprintf("%.2f", $v);
        $sum+=$v;
        s/\d+m/${a}h/;
    }
    print "$_\n";
}
