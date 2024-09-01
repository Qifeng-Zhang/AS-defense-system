#########################################################################

library(vegan)

spe <- read.delim('bacterial-abundance.txt', sep = '\t', row.names = 1, check.names = FALSE)
spe <- data.frame(t(spe))

comm_sim <- 1 - as.matrix(vegan::vegdist(spe, method = 'bray'))

diag(comm_sim) <- 0
comm_sim[upper.tri(comm_sim)] <- 0
comm_sim <- reshape2::melt(comm_sim)
comm_sim <- subset(comm_sim, value != 0)
head(comm_sim)

write.table(comm_sim, 'bacterial_time_decay.txt', sep = '\t', row.names = FALSE, quote = FALSE)

#########################################################################

library(vegan)

spe <- read.delim('phage-abundance.txt', sep = '\t', row.names = 1, check.names = FALSE)
spe <- data.frame(t(spe))

comm_sim <- 1 - as.matrix(vegan::vegdist(spe, method = 'bray'))

diag(comm_sim) <- 0
comm_sim[upper.tri(comm_sim)] <- 0
comm_sim <- reshape2::melt(comm_sim)
comm_sim <- subset(comm_sim, value != 0)
head(comm_sim)

write.table(comm_sim, 'phage_time_decay.txt', sep = '\t', row.names = FALSE, quote = FALSE)

#########################################################################
