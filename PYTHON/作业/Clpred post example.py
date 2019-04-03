#This is a demo program for CGI client programming #Author: Bin-Guang Ma; Date: 2015-12-24; Modified on: 2018-12-7

from urllib.request import urlopen
from urllib.parse import urlencode
#from time import sleep   #stop for a while when you submit multiple seqs to a server

ProSeq = '''ADKELKFLVVDDFSTMRRIVRNLLKELGFNNVEEAEDGVDALNKLQAGGYGFVISDWNMP NMDGLELLKTIRADGAMSALPVLMVTAEAKKENIIAAAQAGASGYVVKPFTAATLEEKLNKIFEKLGM'''

url="http://ibi.hzau.edu.cn/FDserver/cido.php"

inputs = {'textarea': ProSeq, 'radiobutton': 'Two', 'ButtonRatePred': 'Predict Folding Rate'}
params = bytes(urlencode(inputs),encoding='utf-8')

with urlopen(url, params) as f:
     #open url with post method
     result = f.read()
     print(result)
     print('done! (^_^)')
