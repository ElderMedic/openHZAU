#perl course exercise 2
#12.15 Changlin Ke bioinfo1601. All rights reserved.
#please remove comment symbol to run code.

#prob 1
=pod
$seqraw="CGCTCGGGGGGCATGTCAAATGAGCTCAACAACATCATCTCTCGGACCACAGATGGCGTCTATGAGGGCGTGGCCATCGGCGGGGACAGGTACCCTGGCTCAACATTTATGGATCACGTGTTACGTTACCAGGATACTCCAGGAGTAAAAATGATTGTGGTTCTTGGAGAGATAGGGGGCACTGAGGAATACAAGATCTGCCGGGGCATCCAGGAGGGCCGCCTCACCAAGCCCGTGGTCTGCTGGTGCATCGGGACATGTGCCACCATGTTCTCTTCTGAGGTACAGTTCGGCCATGCCGGAGCTTGCGCCAACCAGGCTTCCGAAACTGCAGTAGCCAAGAACCAGGCTTTGAAGGAGGCAGGAGTGTTTGTGCCCCCGAGCTTTGATGAACTTGGAGAAATCATCCAGTCTGTGTATGAAGATCTTGTGGCCAGAGGAGTCATTGTCCCTGCTCAGGAGGTGCCGCCTCCAACCGTGCCCATGGACTACTCCTGGGCCAGGGAGCTGGGTTTGATCCGCAAACCTGCCTCATTCATGACCAGCATCTGTGACGAGCGAGGACAGGAGCTCATCTATGCGGGCATGCCCATCACCGAGGTCTTCAAGGAGGAGATGGGCATTGGTGGGGTCCTTGGCCTCCTGTGGTTCCAGAGAAGGTTGCCCAAGTATGCCTGCCAGTTCATTGAGATGTGCCTGATGGTGACGGCAGATCACGGGCCAGCTGTGTCTGGGGCTCACAACACCATCATCTGCGCTCGGGCTGGGAAGGACCTGGTTTCCAGCCTCACCTCGGGGCTGCTCACTATTGGGGACCGGTTTGGGGGTGCCCTGGATGCTGCTGCCAAGATGTTCAGCAAAGCCTTTGACAGTGGTATTATCCCCATGGAGTTTGTGAACAAGATGAAGAAGGAAGGAAAGCTG";

@seq=split("",$seqraw);
$size=@seq;
@subject=();
@fullseq=();
for($i=0;$i<$size-1;$i++)
{
    $temp="@seq[$i]@seq[$i+1]";
    push(@fullseq,$temp);
    if (grep {$_ eq $temp} @subject) {

    }
    else{
        push(@subject,$temp);
    }

}
$subs=@subject;
@coincidence=();
for($j=0;$j<$subs;$j++)
{

    $coincidence[$j]=grep {$_ eq $subject[$j]} @fullseq;
    $total+=$coincidence[$j];
}

for($h=0;$h<$subs;$h++)
{
    print"@subject[$h]\t";
    $rate=$coincidence[$h]/$total;
    print"$rate\n";
}
=cut

#prob 2
=pod
@array=(
[8,5,0,30,0,0],
[0,0,5,0,71,0],
[2,32,1,1,0,0],
[55,45,42,37,18,15],
);

foreach $item1 (@array)
{
    foreach $item2(sort{$b<=>$a}@{$item1})
    {
        print"$item2,";
    }
    $count=0;
    foreach $i (@$item1)
    {
        $count+=$i;
    }
    print"sum = $count";
    print"\n";
}
=cut

#prob 3
=pod
@array=(
[8,5,0,30,0,0],
[0,0,5,0,71,0],
[2,32,1,1,0,0],
[55,45,42,37,18,15],
);

@newarray=([0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0],
[0,0,0,0]
);

for (my $i = 0; $i <6; $i++) {
    for (my $j = 0; $j <4; $j++) {
        $newarray[$i][$j]=$array[$j][$i];
    }

}

foreach $i (0..$#newarray){print"@{$newarray[$i]}\n";}
=cut

#prob 4
=pod

@candidate = qw(A mixture of novel glycopeptides from glycosylation between cold water fish skin gelatin hydrolysates and glucosamine (GlcN) via transglutaminase (TGase), as well as glycation between fish gelatin hydrolysate and GlcN were identified by their pattern of molecular distribution using MALDI-TOF-MS.);
$gap=0;
$count=@candidate;

for (my $j = 1; $j <9 ; $j++) {
    $temp=$gap+$j-1;
    foreach $i ($gap..$temp)
    {
        print"$candidate[$i]";
    }
    $gap+=$j;
    print"\n";
}

foreach $h ($gap..$count){print"$candidate[$h]"}
=cut

#prob5
=pod
$str=join('*',@candidate);
print"$str";
=cut

#prob 6
=pod
@line=qw/63 96 70 0 9 50 100/;

for my $i(0..$#line) {
       for my $j($i+1..$#line) {
           if($line[$j] < $line[$i]) {
               @line[$i,$j] = @line[$j,$i];  #数组片段，交换i和j的值
           }
       }
   }
foreach (@line) {     #调用子程序
    print $_, " ";
}
=cut
#prob 7
=pod
@coordinate1=qw/101.601  38.534  -1.962/;
@coordinate2=qw/103.062  38.513  -2.159/;
for (my $i = 0; $i <3 ; $i++) {
  $squaredeviance=($coordinate1[$i]-$coordinate2[$i])**2;
  $temp+=$squaredeviance;
}
$distance=sqrt $temp;
print"distance between two atoms is:$distance";
=cut

#prob 8
=pod
$seqa="aagcttgctttcattagaaagacgagacagcagctttccaaagatacacacagcacttga";
$seqb="aagcttgctttcatttgaaagacgagacagcagctttccaaagattcacacagcacatga";
@str1=split "",$seqa;
@str2=split "",$seqb;
for (my $i = 0; $i < length $seqa ; $i++) {
  if ($str1[$i] ne $str2[$i]) {
    $actualpos=$i+1;
    print"mutation position:$actualpos\n";
    print"mutated base:$str2[$i]\n";
  }

}
=cut


#prob 9
=pod
@array=(1,3,6,3,7,34,6,3,7,9,3,0,1,4,8,5,55,90,11,24,67,90,39,2,90,34);
@new=();
foreach $i (@array)
{
    $s=grep {$_ eq $i} @new;

    if (grep {$_ eq $i} @array) {
        if ($s==0) {
            push(@new,$i);
        }


    }


}
foreach $j (@new){print"$j\t";}
=cut
