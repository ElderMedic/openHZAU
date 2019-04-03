#perl作业4

#remove annotation =pod =cut to run code and it's strongly recommended to paste the code to a new environment to test.

use warnings; #global setting

#prob 1 实现功能：通过调用子函数，判断每次输入的数值的奇偶性。
=pod
chomp($user_input=<STDIN>);
&odd_parity($user_input);

sub odd_parity {
  my $input=$_[0];
  if ($input % 2==0 && $input>=0) {
    print"the input figure $input is even\n";
  }
  elsif($input % 2!=0 && $input>=0){
    print"the input figure $input is odd\n";
  }
  else{
    print"wrong input";
  }
}
=cut

#prob 2 实现功能：通过调用子函数，打印某个文件夹下面所有的文件（包括子文件中的文件）名和路径，并将列表保存在“filepath.txt”文件中。
=pod
$default_path="D:/*";
&path_explorer($default_path);

sub path_explorer {
  $default=$_[0];
  my @files=glob($default);

  foreach(@files){
    if(-d $_){
      print"$_  type:folder\n";
      path_explorer($_."/*");
    }
    elsif(-f $_){
      print"$_ type:file\n";
    }
  }
}
=cut

#prob 3 实现功能：当用户输入一个邮箱地址，判断其是否合法（如name@a63.com 为合法邮件地址）
=pod
chomp($raw_input=<STDIN>);
&email_adress($raw_input);

sub email_adress {
  my $input=$_[0];
  if ($input=~/.+[@].+[\.]\w+/) {
    print"you've got a correct email adress!";
  }
  else{
    print"unavailable adress check format pls.";
  }
}
=cut
#prob 4 实现功能：
# hzau.txt 是华农网站(www.hzau.edu.cn)源代码。请用正则表达式找出所有的链接（例如："href="http://lst.hzau.edu.cn/">生命科学技术学院"中
# http://lst.hzau.edu.cn 就为一个链接）。
=pod
open(READTXT, "<D:/hzau.txt") or die "can't open txtfile $!";
while (<READTXT>) {
  $data=$_;
  if ($data=~/https?:\/\/.+">[^<]/) {
    print"$&\nmatch\n";
  }

}

close READTXT or die "can't close txtfile $!";
=cut

#prob 5 实现功能1：通过调用子函数，求出DNA的另一条链。（☆☆）
  #实现功能2：通过调用子函数，求出所给数据中GC含量。（☆☆☆）
=pod
while (<DATA>) {
  @line=split(//,$_);
  if ($line[0] ne ">") {
    foreach(@line){
      chomp($_);
      push(@data,$_);
    }
  }
}

&complement(@data);
&countGC(@data);

sub complement {
  my @base=@_;
  foreach(@base){
    if ($_ eq "A") {
      $replace = "T";
    }
    elsif($_ eq "T"){
      $replace="A";
    }
    elsif($_ eq "C"){
      $replace="G";
    }
    elsif($_ eq "G"){
      $replace="C";
    }
    push(@new_data,$replace);
  }
  print"@new_data";#to temove gap between each base use print @new_data;
}

sub countGC {
    my @base=@_;
    foreach (@base) {
        if ($_ eq "C" || $_ eq "G") {
            $count++;
        }

    }
    print"\nG+C = $count\n";

}

__DATA__
>gi|55380579|gb|AE014297.2| Drosophila melanogaster chromosome 3R, complete sequence
GAATTCTCTCTTGTTGTAGTCTCTTGACAAAATGCAATGGTCAGGTAGCGTTGTTCTAAACTCAAGATTT
AAAGGTGAATAGTCCTGTAAGCCCTATAAACATATGTACATAGGTAGGCCAGTACTTAGTACTGGCACAT
GCCGCTGATCTGTTAGTAGATTATCCATTTCCCTTCAGCGCCTACCTGCGTCACCAATGATGAGGTCGAG
ACAGAATCCTACTAGTACCTGCCTCGAGTCGATCGGGCAGAGAGCGAGAAATGGTAAGCAGGTGAGTGAG
CGCAGAGAGCGTCTTTCGACGACTCTTTCGTCGCGAGCAAACAACAAGTAGACGTCGCTCAGACACTGTC
GGCCAGATTCATTTTCCAGAAAGACGTCGTCGCGTTGACAAGCTTAAATTCGTAGCGGGCGCCAGTAGGA
CGACCCAGTGGATATCGTCAGTTGAACCAGGGGAAACGTAGCAGCCCAGTTACATTGCTCGGGAGGGGTA
=cut

#prob 6  实现功能：通过调用子函数，求氨基酸残基两两之间的距离；（☆☆☆）
#并通过调用子函数，print出距离最远的一对氨基酸残基。（☆）
=pod
while (<DATA>) {
    @line=split(/  /,$_);
    @line2=split(/ /,$line[7]);
    $dictX{$line[1]}=$line[6];
    $dictY{$line[1]}=$line2[0];
    $dictZ{$line[1]}=$line2[1];
}
&distance;
&farthest;
sub distance {
    print"pls input fitst aa No.";
    chomp(my $aa1=<STDIN>);
    print"pls input second aa No.";
    chomp(my $aa2=<STDIN>);
    my @dataaa1=($dictX{" $aa1"},$dictY{" $aa1"},$dictZ{" $aa1"});
    my @dataaa2=($dictX{" $aa2"},$dictY{" $aa2"},$dictZ{" $aa2"});

    $end=&countdistance(@dataaa1,@dataaa2);
    print"the distance between aa you input is $end\n";
}

sub countdistance{
    my ($data1,$data2,$data3,$data4,$data5,$data6)=@_;
    $data11=$data1-$data4;
    $data22=$data2-$data5;
    $data33=$data3-$data6;
    my $result=sqrt($data11**2+$data22**2+$data33**2);

    return $result;

}

sub farthest {
    $max=0;
    foreach (keys %dictX){
        my $AA1=$_;
        foreach(keys %dictY){
            my $AA2=$_;
            my @dataAA1=($dictX{"$AA1"},$dictY{"$AA1"},$dictZ{"$AA1"});
            my @dataAA2=($dictX{"$AA2"},$dictY{"$AA2"},$dictZ{"$AA2"});
            my $result1=&countdistance(@dataAA1,@dataAA2);
            if ($result1>$max) {
                $max=$result1;
            }

        }
    }
    print"the farthest distance between two aas are $max";
}

__DATA__
ATOM   4542  CA  LYS D 130      27.728  42.781 107.352  1.00 53.17           C
ATOM   4551  CA  VAL D 131      28.783  40.337 110.073  1.00 46.40           C
ATOM   4558  CA  LYS D 132      30.084  42.479 112.907  1.00 52.26           C
ATOM   4567  CA  ALA D 133      31.868  41.767 116.183  1.00 53.70           C
ATOM   4572  CA  LYS D 134      28.704  41.872 118.303  1.00 71.02           C
ATOM   4581  CA  SER D 135      26.883  39.124 116.249  1.00 78.80           C
ATOM   4587  CA  ILE D 136      29.774  36.647 116.820  1.00 93.90           C
ATOM   4595  CA  VAL D 137      28.482  35.979 120.344  1.00117.21           C
ATOM   4602  CA  PHE D 138      27.994  33.911 123.464  1.00133.01           C
ATOM   4613  CA  HIS D 139      26.718  30.262 123.566  1.00139.94           C
ATOM   4623  CA  ARG D 140      29.353  28.808 121.207  1.00139.51           C
ATOM   4634  CA  LYS D 141      30.584  25.201 121.443  1.00131.58           C
ATOM   4642  CA  LYS D 142      33.749  25.778 123.504  1.00113.11           C
ATOM   4651  CA  ASN D 143      37.231  24.833 122.254  1.00 94.20           C
ATOM   4659  CA  LEU D 144      36.495  27.447 119.636  1.00 69.72           C
ATOM   4667  CA  GLN D 145      38.015  30.917 119.225  1.00 40.46           C
ATOM   4676  CA  TYR D 146      37.259  33.717 116.776  1.00 28.66           C
ATOM   4688  CA  TYR D 147      39.566  36.141 114.844  1.00 24.27           C
ATOM   4700  CA  ASP D 148      38.913  38.812 112.220  1.00 32.21           C
ATOM   4708  CA  ILE D 149      41.467  38.220 109.408  1.00 35.28           C
ATOM   4716  CA  SER D 150      42.088  39.987 106.101  1.00 32.96           C
ATOM   4722  CA  ALA D 151      43.967  37.479 103.880  1.00 32.91           C
ATOM   4727  CA  LYS D 152      44.860  40.086 101.166  1.00 35.10           C
ATOM   4736  CA  SER D 153      46.596  42.467 103.623  1.00 32.49           C
ATOM   4742  CA  ASN D 154      47.988  39.768 105.958  1.00 28.75           C

=cut



#Alternative 1
=pod
sub hanoi {
  my ($n, $start, $end, $extra) = @_;
  if ($n == 1) {
    print "Move disk #1 from $start to $end.\n";   # Step 1
  } else {
    hanoi($n-1, $start, $extra, $end);             # Step 2
    print "Move disk #$n from $start to $end.\n";  # Step 3
    hanoi($n-1, $extra, $end, $start);             # Step 4
  }
}
hanoi(3,'a','b','c');
=cut


#Alternative 2
=pod

use warnings;

sub file_clean
{
    my $address = $_[0];
    opendir (DIR, $address) or die "Couldn't open directory, $!";
    my @direc = ();
    while (my $file = readdir DIR)
    {
            $file = $address."/".$file;
            if(-f $file and $file =~ /.*\.tmp$|.*\._mp$|.*\.bak$|.*\.old$|.*\.syd$|.*\.gid$|.*\.chk$|.*\.dir$|.*\.dmp$|.*\.nch$/)
            # check if it's windows temporary file
            {
                print("$file\n");
                unlink $file;
            }
            elsif(-d $file and $file !~ /.*\.$/)
            {
                push(@direc, "$file");
            }
    }
    closedir DIR;
    if(scalar @direc != 0)                                        # 对于目录进行迭代
    {
        foreach (@direc)
        {

            file_clean($_);
        }
    }

}

file_clean("D:/");
=cut
