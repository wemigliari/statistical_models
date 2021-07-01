
####### Brief introduction


library(maps)

cities <- world.cities
plot(cities$pop)


####### Genominformatics                                                       ### https://stackoverflow.com/questions/59487255/chromoplot-error-reads-more-data-than-in-file


library(dplyr)


df = data.frame(chr=c("chr1","chr2","chr3"),    
                start=1,end=c(100e6,120e6,80e6),cent=c(50e6,60e6,70e6))
write.table(df,"chromosome_file.txt",quote=F,
            sep="\t",row.names=FALSE,col.names=FALSE)
anno = data.frame(Ele=c("Feature1","Feature2"),
                  chr=c("chr2","chr3"),start=c(50000,55000),
                  end=c(60000,70000),score=c(77,88))
write.table(anno,"anno.txt",quote=F,
            sep="\t",row.names=FALSE,col.names=FALSE)



library(chromoMap)                                                                     #### https://cran.r-project.org/web/packages/chromoMap/vignettes/chromoMap.html

#Code 1 for Sahlgrenska institutet

chromoMap("chromosome_file.txt","anno.txt")


#Code 2 for Sahlgrenska institutet

chromoMap("chromosome_file.txt","anno.txt",
          data_based_color_map = T,
          data_type = "categorical",
          data_colors = list(c("orange","steelblue")))





