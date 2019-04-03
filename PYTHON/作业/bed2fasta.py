# _*_ coding: UTF-8 _*_
import argparse
import string


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


def make_genome_fasta_dict(genome_fasta_path=""):
    # loading FASTA file and return a dict
    genome_fasta_dict = {}
    for fasta_record in read_fasta(genome_fasta_path):
        chrom_name,chrom_seq = fasta_record
        genome_fasta_dict[chrom_name] = chrom_seq

    return genome_fasta_dict


def reverse_complement_seq(seq="ATCG",reverse_state=True,complement_state=True):
    if reverse_state:
        seq = seq[::-1]

    if complement_state:
        reverse_complement_table = string.maketrans("ATCG", "TAGC")
        seq = seq.translate(reverse_complement_table)

    return seq


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description="This code is for converting job.")

    parser.add_argument("-g", "--GenomeFasta",
                        help="Genome sequence with standard FASTA format",required=True)

    parser.add_argument("-i", "--InputBed",
                        help=r"Input bed have to bed standard BED format,more information can be found at https://genome.ucsc.edu/FAQ/FAQformat.html#format1")

    args = parser.parse_args()
    args.GenomeFasta = "D:/Jupyter_Workspace/fuckpython/chr11.fa"
    # args.GenomeFasta = "/Users/meng/PycharmProjects/genome_data/hg19/chr1.fa"

    try:
        genome_dict = make_genome_fasta_dict(args.GenomeFasta)
    except:
        raise IOError("Error in loading genome FASTA")
    args.InputBed = "D:/Jupyter_Workspace/fuckpython/sncRNA.hg19.bed"
    # args.InputBed = "/Users/meng/PycharmProjects/songjh_project/data/pus10_parclip/overlap_peak_in_total_cluster.bed"
    
    with open(args.InputBed,"r") as input_file:
        for index,line in enumerate(input_file):
            line = line.strip().split("\t")
            chrom_name = line[0]
            chrom_start = int(line[1])
            chrom_end = int(line[2])

            name_state = False
            strand_state = False

            if len(line) >= 4:
                name_state = True

            if len(line) >= 5:
                strand_state = True

            if strand_state:
                seq_strand = line[5]
            else:
                seq_strand = "+"

            if name_state:
                seq_name = ">{0}_{1}_{2}".format(line[3],index+1,seq_strand)
            else:
                seq_name = ">output_{0}_{1}".format(index+1,seq_strand)

            if chrom_name in genome_dict.keys():
                seq = genome_dict.get(chrom_name)[chrom_start:chrom_end]

                if seq:
                    seq = seq.upper()
                    if seq_strand == "-":
                        seq = reverse_complement_seq(seq,reverse_state=True,complement_state=True)

                    print(seq_name)
                    print(seq)








