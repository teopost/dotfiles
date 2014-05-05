echo "

SSH UNISI
=========
ssh oracl1.pro.unisi.it -l root piu6havooracl1 
ssh palladio.qitam.unisi.it -l root piu6havo

SSH CESIA
=========

# cluster produzione (welcome1)
csshx oracle@oda11 oracle@ora12 oracle@oda21 oracle@ora22
csshx oracle@oda31 oracle@ora32 oracle@oda41 oracle@ora42

# produzione (welcome1)
ssh oda11 -l oracle
ssh oda12 -l oracle
ssh oda31 -l oracle
ssh oda32 -l oracle

# produzione vecchio db (ces132sna)
ssh 137.204.225.131 -l oracle 
ssh 137.204.225.132 -l oracle
ssh 137.204.225.133 -l oracle
ssh 137.204.225.134 -l oracle

# muletto (welcome1) i- [oradb01.personale.dir.unibo.it oradb01]
ssh 137.204.225.202 -l oracle 

"
