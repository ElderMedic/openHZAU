#perl course exercise 1
#11.26 Changlin Ke bioinfo1601. All rights reserved.
#please remove comment symbol to run code.

#prob1
#$a=<STDIN>;
#print"$a,welcome to perl programming course!";

#prob2
#$a=<STDIN>;
#if ($a>100) {
#  printf("%d\n",$a);
#  printf("%x\n",$a);
#  printf("%o\n",$a);
#}else{print"kidding me?gt than 100 input idiot!"}

#prob3
=pod
$a=<STDIN>;$b=<STDIN>;
$c=$a+$b;
print"$a+$b=$c\n";
$c=$a-$b;
print"$a-$b=$c\n";
$d=$a * $b;
print"$a*$b=$d\n";
$e=$a / $b;
print"$a/$b=$e\n";
$c=$a**$b;
print"$a**$b=$c\n";
=cut

#prob4
=pod
use Math::Trig;
$a=<STDIN>;
$c=2*pi*$a;
$s=pi*$a*$a;
print"$c\t"."$s\n";
=cut

#prob5
=pod
$a=<STDIN>;
if ($a>50) {
  print"the data is bigger than 50!";
} else {
  print"the data is less than 50!";
}
=cut

#prob6
=pod
$a=1;
while ($a<50) {
  if ($a % 2 ne 0) {
    $b += $a;
    $count += 1;
    if ($count ne 5) {
      print"count is $a\t"
    } else {
      print"count is $a\n"
    }
  }
  $a += 1;
}
print"Total is $b\n";
=cut

#prob7
=pod
$a="abcdfeg";$b="higklmn";
$c=$a.$b;
print "$c\n";
while ($c ne "") {
  print(chop($c));
}
=cut

#prob8
=pod
print"Please input your ID:\t";
$id=<STDIN>;
if ($id eq "perlbaby\n") {
  print"Welcome perlbaby!\n"."please input your password:";
  $pd=<STDIN>;
  chomp($pd);
  if ($pd eq "helloperl") {
    print"your password is correct!but I have nothing to show you now!";
  } else {
    $try=1;
    while ($try <= 3) {
      print"Dont fool me,your password is wrong!\n"."please input again before too late:";
      $pd=<STDIN>;
      chomp($pd);
      $try+=1;
      if ($pd eq "helloperl") {
        last;
      }

    }
print"enough,try again tomorrow!goodbye idiot!";
  }
}else{
  print"your input id is not authorized! dont waste your time here.\n";
}
=cut

#prob9
=pod
print"how many rows of * you want? like 5 i guess?";
$rows=<STDIN>;
chomp($rows);
$times=1;
while ($times ne $rows) {
  print"*" x $times;
  print"\n";
  $times +=1;
  if ($times eq $rows) {
    print"*" x $times;
    last;
  }
}
=cut

#prob10
=pod
$seq="MNAPERQPQPDGGDAPGHEPGGSPQDELDFSILFDYEYLNPNEEEPNAHKVASPPSGPAYPDDVLDYGLKPYSPLASLSGEPPGRFGEPDRVGPQKFLSAAKPAGASGLSPRIEITPSHELIQAVGPLRMRDAGLLVEQPPLAGVAASPRFTLPVPGFEGYREPLCLSPASSGSSASFISDTFSPYTSPCVSPNNGGPDDLCPQFQNIPAHYSPRTSPIMSPRTSLAEDSCLGRHSPVPRPASRSSSPGAKRRHSCAEALVALPPGASPQRSRSPSPQPSSHVAPQDHGSPAGYPPVAGSAVIMDALNSLATDSPCGIPPKMWKTSP";
$len=length($seq);
$count=0;
while ($seq ne "") {
  $test=chop($seq);
  if ($test eq "A") {
    $count+=1;
  }

}
print"length of the sequence is $len\n"."there are $count A";
=cut
