import sys

f=open(sys.argv[1])

a=str(sys.argv[1])
if '/' in a:
        a=a.split('/')[-1].strip()
a=a.split('.')
a.pop()

b=''
for i in a:
        b+=i.strip()+'.'
        
x=open(b+'csq.gff3','a')

for i in f:
        if 'mRNA' in i:
                i=i.replace ('mRNA','transcript')
                i=i.replace ('ID=','ID=transcript:')
                i=i.replace ('Parent=','Parent=gene:')
                if 'Name=' in i:
                        i=i.replace('Name=','biotype=protein_coding;Name=')
                else:
                        i=i.strip()+";biotype=protein_coding\n"

        elif 'gene' in i:
                i=i.replace ('ID=','ID=gene:')
                if 'Name=' in i:
                        i=i.replace('Name=','biotype=protein_coding;Name=')
                else:
                        i=i.strip()+";biotype=protein_coding\n"
        else:
                i=i.replace ('Parent=','Parent=transcript:')
        
        x.write(i)
                
f.close()
x.close()
