# _*_ coding:UTF-8 _*_
# with open(r"D:\data_file\test.fa","r") as input_file:
#     seq = ""
#     header = input_file.readline().strip()[1:]
#     for line in input_file:
#         line = line.strip()
#         if line[0] != ">":
#             seq = seq + line
#         else:
#             print header
#             print seq
#             header = line[1:]
#             seq  = ""
#     print header
#     print seq

def read_fasta(file_path=""):
    """
    Loading FASTA file and return a iterative object
    """

    line = ""

    try:
        fasta_handle = open(file_path,"r")
    except:
        raise IOError("Your input FASTA file is not right!")

    # make sure the file is not empty
    while True:
        line = fasta_handle.readline()
        if line == "":
            return
        if line[0] == ">":
            break

    # when the file is not empty, we try to load FASTA file
    while True:
        if line[0] != ">":
            raise ValueError("Records in Fasta files should start with '>' character")
        title = line[1:].rstrip()
        lines = []
        line = fasta_handle.readline()
        while True:
            if not line:
                break
            if line[0] == ">":
                break
            lines.append(line.rstrip())
            line = fasta_handle.readline()

        yield title,"".join(lines).replace(" ","").replace("\r","")

        if not line:
            return

    fasta_handle.close()
    assert False, "Your input FASTA file have format problem."

for header,seq in read_fasta(file_path=r"D:\data_file\test.fa"):
    print header
    print seq

hg19_genome = {}
for chr_name , chr_seq in read_fasta(file_path=r"D:/data_file/hg19_only_chromosome.fa"):
    hg19_genome[chr_name] = chr_seq














