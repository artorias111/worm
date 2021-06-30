#combine tsvs

f1= open('telseq.tsv','r')
f2= open('strain_list.tsv','r')
f3=open('combine.tsv','a')

list1=list(f1)
list2=list(f2)

l=len(list1)

for i in range(l):
    f3.write(list2[i].rstrip("\n")+"\t"+list1[i])

f1.close()
f2.close()
f3.close()