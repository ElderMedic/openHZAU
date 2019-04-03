# _*_ coding = UTF-8 _*_

output_file = open(r"D:\data_file\test.fa","w")

with open(r"D:\data_file\test.fastq","r") as input_fastq:
    for index,line in enumerate(input_fastq):
        if index % 4 == 0:
            output_file.write(">" + line.strip()[1:] + "\n")
        elif index % 4 == 1:
            for i in range(0,len(line.strip()),40):
                output_file.write(line.strip()[i:i+40] + "\n")
        elif index % 4 == 2:
            continue
        elif index % 4 == 3:
            continue

