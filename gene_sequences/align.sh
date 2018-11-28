#problem 1 script

#sporecoat

#concatenates fasta files into one fasta file

list=$(find sporecoat*)
for file in $list
do
cat $file >> sporecoat.fasta
cat sporecoat.fasta | sed -E 's/[A-Z]>/&\
>/g' | sed -E 's/>$//g' > all_sporecoat_seq.fasta
done

#aligns sporecoat fasta file

/afs/nd.edu/user24/jwhalen1/local/bin/muscle3.8.31_i86linux64 -in all_sporecoat_seq.fasta -out all_sporecoat_seq.fasta.align


#transporter

#concatenates transporter fasta files into one fasta file

set=$(find transporter*)
for file in $set
do
cat $file >> transport.fasta
cat transport.fasta | sed -E 's/[A-Z]>/&\
>/g' | sed -E 's/>$//g' > all_transporter_seq.fasta
done


#aligns transporter fasta
/afs/nd.edu/user24/jwhalen1/local/bin/muscle3.8.31_i86linux64 -in all_transporter_seq.fasta -out all_transporter_seq.fasta.align
