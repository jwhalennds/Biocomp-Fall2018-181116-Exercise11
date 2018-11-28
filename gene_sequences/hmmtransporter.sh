#problem 2, hmm search for transporter gene
#usage: bash hmmtransporter.sh
#creating transporter hmm profile
/afs/nd.edu/user24/jwhalen1/local/bin/hmmbuild transporter.hmm all_transporter_seq.fasta.align

#searching against proteomes for hits

list=$(find ./proteomefastas/*fasta)
for fasta in $list
do
/afs/nd.edu/user24/jwhalen1/local/bin/hmmsearch --tblout $fasta_hmmresults.txt transporter.hmm $fasta
echo $fasta >> hits.csv
less -S $fasta_hmmresults.txt | grep -v -c "#" >> hits.csv
done


