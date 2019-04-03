def fnareadIntoList(filename):
    ifl=open(filename,'rt')
    iflst=ifl.readlines()
    ifl.close()
    iflstlen=len(iflst)
    seqlist=[]
    aseq = []
    titstr = ''
    seqstr=''
    for i in iflst:
        i = i.strip()
        if i[0]=='>':
            titstr = i
            if seqstr!='':
                aseq.append(pretitstr)
                aseq.append(seqstr)
                seqlist.append(aseq)
                seqstr = ''
                aseq = []
        else:
            seqstr += i
            pretitstr = titstr
    aseq = [titstr, seqstr]
    seqlist.append(aseq)
    return seqlist
def pttreadIntoList(filename):
    import csv
    csvFile = open(filename, "rt",encoding='UTF-8')
    result = csv.DictReader(csvFile)
    return result
    csvFile.close()
def translate(strx):
    listx=''
    i=0
    while i<len(strx):
        if strx[i:i+3] =='TTT' or strx[i:i+3] =='TTC':
            listx+='F';i+=3
        elif  strx[i:i+3]=='TTC' or strx[i:i+3] =='TTG':
            listx+='L';i+=3
        elif strx[i:i+3] =='TCT' or strx[i:i+3] =='TCC' or strx[i:i+3] == 'TCA' or strx[i:i+3] =='TCG':
            listx+='S';i+=3
        elif strx[i:i+3] =='TAT' or strx[i:i+3] =='TAC':
            listx+='Y';i+=3
        elif strx[i:i+3] =='TAA' or strx[i:i+3] =='TAG' or strx[i:i+3] =='TGA':
            listx+='*';i+=3
        elif strx[i:i+3] =='TGT' or strx[i:i+3] =='TGC':
            listx+='C';i+=3
        elif strx[i:i+3] =='TGG':
            listx+='W';i+=3
        elif strx[i:i+3] =='CTT' or strx[i:i+3] =='CTA' or strx[i:i+3] =='CTG' or strx[i:i+3] =='CTC':
            listx+='L';i+=3
        elif strx[i:i+3] =='CCA' or strx[i:i+3] =='CCT' or strx[i:i+3] =='CCG' or strx[i:i+3] =='CCC':
            listx+='P';i+=3
        elif strx[i:i+3] =='CAT' or strx[i:i+3] =='CAC':
            listx+='H';i+=3
        elif strx[i:i+3] =='CAA' or strx[i:i+3] =='CAG':
            listx+='Q';i+=3
        elif strx[i:i+3] =='CGA' or strx[i:i+3] =='CGT' or strx[i:i+3] =='CGG' or strx[i:i+3] =='CGC':
            listx+='R';i+=3
        elif strx[i:i+3] =='ATT' or strx[i:i+3] =='ATA' or strx[i:i+3] =='ATC':
            listx+='I';i+=3
        elif strx[i:i+3] =='ATG':
            listx+='M';i+=3
        elif strx[i:i+3] =='ACA' or strx[i:i+3] =='ACT' or strx[i:i+3] =='ACG' or strx[i:i+3] =='ACC':
            listx+='T';i+=3
        elif strx[i:i+3] =='AAT' or strx[i:i+3] =='AAC':
            listx+='N';i+=3
        elif strx[i:i+3] =='AAA' or strx[i:i+3] =='AAG':
            listx+='K';i+=3
        elif strx[i:i+3] =='AGT' or strx[i:i+3] =='AGC':
            listx+='S';i+=3
        elif strx[i:i+3] =='AGA' or strx[i:i+3] =='AGG':
            listx+='R';i+=3
        elif strx[i:i+3] =='GTA' or strx[i:i+3] =='GTT' or strx[i:i+3] =='GTC' or strx[i:i+3] =='GTG':
            listx+='V';i+=3
        elif strx[i:i+3] =='GCA' or strx[i:i+3] =='GCT' or strx[i:i+3] =='GCG' or strx[i:i+3] =='GCC':
            listx+='A';i+=3
        elif strx[i:i+3] =='GAT' or strx[i:i+3] =='GAC':
            listx+='D';i+=3
        elif strx[i:i+3] =='GAA' or strx[i:i+3] =='GAG':
            listx+='E';i+=3
        elif strx[i:i+3] =='GGA' or strx[i:i+3] =='GGT' or strx[i:i+3] =='GGC' or strx[i:i+3] =='GGG':
            listx+='G';i+=3
        else:
            i+=3
    return listx
fnaflname = 'text.fna'
pttflname = 'location.csv'
fnaseqlst = fnareadIntoList(fnaflname)
pttseqlst = pttreadIntoList(pttflname)
oflname = 'D:/frq.txt'
ofl = open(oflname, 'wt')
for row in pttseqlst:
    num1=''
    num2=''
    dnastr=''
    num1=row['Location']
    ppos=num1.index('.')
    num2=num1[0:ppos]
    lenstr=len(num1)
    num1=num1[ppos+2:lenstr]
    num1=int(num1)
    num2=int(num2)-1
    dnastr=fnaseqlst[0][1][num2:num1]
    cdnastr=''
    if row['Strand']=='-':
        for c in range(len(dnastr)):
            if dnastr[c] == 'A':
                cdnastr +='T'
            elif dnastr[c]=='G':
                cdnastr +='C'
                cdnastr +='G'
            elif dnastr[c]=='T':
                cdnastr +='A'
    #pid = row['PID']
    ofl.write(pid +':'+'\t')
    if row['Strand']=='+':
        ofl.write(dnastr + '\n')
        qcount=dnastr.count('TAC')
        qcount=str(qcount)
        ofl.write("起始密码子个数："+qcount + '\n')
        aaseq=translate(dnastr)
        ofl.write("AAseq:"+'\n'+aaseq+'\n')
    else:
        cdnastr=cdnastr[::-1]
        ofl.write(cdnastr + '\n')
        qcount=cdnastr.count('TAC')
        qcount=str(qcount)
        ofl.write("起始密码子个数："+qcount + '\n')
        aaseq=translate(cdnastr)
        ofl.write("AAseq:"+'\n'+aaseq+'\n')
ofl.close()
