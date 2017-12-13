from collections import OrderedDict
import inflect
import sys

p = inflect.engine()

with open("input_imkdir.sh", "w") as file:
    file.write("imkdir /tempZone/home/rods/a\n");
    for i in range(int(sys.argv[1])):
        file.write("imkdir \"/tempZone/home/rods/a/" + p.number_to_words(i) + "\"\n")


