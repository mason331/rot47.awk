###########
# rot47.awk
###########

GNU custom awk function for rot47

Examples:

$ echo Hello World | sh rot47.awk

w6==@ (@C=5

$ echo Hello World | sh rot47.awk | sh rot47.awk

Hello World

##############
# rot47_tr.awk
##############

Examples:

$ echo Hello World | sh rot47_tr.awk

w6==@ (@C=5

$ echo Hello World | sh rot47_tr.awk | sh rot47_tr.awk

Hello World


#########################

# rot47_hl7_sub-field.awk

#########################

Apply rot47 to HL7 sub-fielfs

Examples:

$ cat xx.txt
5|AAA_BBB|123|Pie^subfield2|Apple^subfield2|F|19500111|20191028091051|B
8|AAA_BBB|234|Juice^subfield2|Orange^subfield2|F|19800123|20191028091051|B

$ cat xx.txt | sh rot47_hl7_sub-field.awk
5|AAA_BBB|123|!:6^subfield2|pAA=6^subfield2|F|19500111|20191028091051|B
8|AAA_BBB|234|yF:46^subfield2|~C2?86^subfield2|F|19800123|20191028091051|B

$ cat xx.txt | sh rot47_hl7_sub-field.awk | sh rot47_hl7_sub-field.awk
5|AAA_BBB|123|Pie^subfield2|Apple^subfield2|F|19500111|20191028091051|B
8|AAA_BBB|234|Juice^subfield2|~range^subfield2|F|19800123|20191028091051|B



