f1=open("nohup.out",'r')
f2=open("temp.tsv",'a')

x=[]
l2=[]

l1=list(f1)
for i in l1:
    if 'of' in i:
        x=i.split(' ')
        s=x[4].rstrip(')')
        s=s.lstrip('(')
        l2.append(s)


t=[]
for i in l2:
    if i not in t:
        f2.write(i)
        f2.write("\n")
        t.append(i)

f1.close()
f2.close()