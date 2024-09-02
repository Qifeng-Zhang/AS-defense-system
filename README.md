# Long-Term Dynamics Reveal Antiviral Defense Systems as Key Stabilizers of Complex Bacterial Communities
Support scripts for this project.

## Sections

### 1) Bacterial and phage communities
* **01_Quality_control.sh** Quality control of metagenomic raw reads using [KneadData](https://github.com/biobakery/kneaddata).
* **02_Assembly.sh** Metagenomic clean reads assembly using [MEGAHIT](https://github.com/voutcn/megahit).
* **03_Bacterial_community.sh** Analysis of bacterial communities using [Kraken2](https://github.com/DerrickWood/kraken2) and [Bracken](https://github.com/jenniferlu717/Bracken).
* **04_Phage_identification.sh** Identification of phage using [VirSorter2](https://github.com/jiarong/VirSorter2) and [VirBrant](https://github.com/Strong-Lab/VirBrant).
* **05_Phage_merge.sh** Merge the output of [VirSorter2](https://github.com/jiarong/VirSorter2) and [VirBrant](https://github.com/Strong-Lab/VirBrant) and extract the phage sequence using shell and [SeqKit](https://github.com/shenwei356/seqkit).
* **06_Phage_high_confidence.sh** Use [CheckV](https://pypi.org/project/checkv/) to filter the phage sequences generated by [VirSorter2](https://github.com/jiarong/VirSorter2) and [VirBrant](https://github.com/Strong-Lab/VirBrant) to obtain high-confidence phage sequences.
* **07_Phage_species_level_clustering.sh** Species-level clustering of phage sequences using [cd-hit](https://github.com/weizhongli/cdhit).
* **08_Phage_abundance.sh** Calculate the abundance of phages using [CoverM](https://github.com/wwood/CoverM).
* **09_Time_decay_relationship.R** Calculating the time decay relationship of bacterial and phage communities using the R package [vegan](https://github.com/vegandevs/vegan).

### 2) Identification and quantification of antiviral defense systems
* **01_Binning.sh** Binning using [MetaWRAP](https://github.com/bxlab/metaWRAP).
* **02_Gene_prediction_contig.sh** Use [Prodigal](https://github.com/hyattpd/Prodigal) to predict orfs in contigs.
* **03_Gene_prediction_MAG.sh** Use [Prodigal](https://github.com/hyattpd/Prodigal) to predict orfs in MAGs.
* **04_Denfense_system_contig.sh** Identify complete defense systems in contigs using [DefenseFinder](https://github.com/mdmparis/defense-finder).
* **05_Denfense_system_MAG.sh** Identify complete defense systems in MAGs using [DefenseFinder](https://github.com/mdmparis/defense-finder).
* **06_Taxonomic_annotation_contig.sh** Taxonomic annotation of contigs containing complete defense systems using [Kraken2](https://github.com/DerrickWood/kraken2) and [KrakenTools](https://github.com/jenniferlu717/KrakenTools).
* **07_Taxonomic_annotation_MAG.sh** Taxonomic annotation of MAGs using [GTDB-Tk](https://github.com/Ecogenomics/GTDBTk).
* **08_Denfense_system_abundance_contig.sh** Calculate the abundance of defense systems using [CoverM](https://github.com/wwood/CoverM).
* **09_ANI_MAG.sh** Use [FastANI](https://github.com/ParBLiSS/FastANI) to calculate ANI between MAGs.
* **10_Phylogenetic_tree_MAG.sh** Use [PhyloPhlAn](https://github.com/biobakery/phylophlan) to construct a phylogenetic tree of MAGs.

### 3) Identification and extraction of CRISPR spacers and their matching with vOTUs
* **01_CRISPR_spacer_identify.sh** Identify and extract CRISPR spacers in clean reads using [CRASS](https://github.com/ctSkennerton/crass).
* **02_CRISPR_spacer_de-redundancy.sh** De-redundancy of CRISPR spacers using [cd-hit](https://github.com/weizhongli/cdhit).
* **03_CRISPR_sapcer_match_vOTU.sh** Matching CRISPR spacers and vOTUs using [BlastN](https://blast.ncbi.nlm.nih.gov/Blast.cgi).

### 4) Strain dynamics and identification of MGEs
* **01_Consensus_strain.sh** Reconstruction of consensus strain sequences using [MetaPhlAn](https://github.com/biobakery/MetaPhlAn) and [StrainPhlAn](https://github.com/biobakery/MetaPhlAn).
* **02_MGEs_in_contigs.sh** Annotation of MGEs in contigs using [mobileOG-db](https://github.com/clb21565/mobileOG-db).
