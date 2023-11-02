#############################
## Get Cmon plotid
## Bruno De Vos 14/05/2019
#############################

library(raster)

##############--------------------------------------------------
#Load raster for reference =>> make raster with plotnrs instead of legend ? 

r.LUCMon<-raster("C:/R_scripts/R_Raster/DATA/LUCMon2016trim.tif")  ### 215513424 cells in trimmed version
leg<-c("1.Forest","2.Nature","3.Grassland","4.Cropland",
       "5.Residential","6.Sealed","7.Water","8.Unclassified")
mycol<-c("dark green","yellow","light green","orange",
         "magenta","red","blue","light grey")
veldnamen<-c("PlotNo","PlotID","c.LB72X","c.LB72Y","LUCMON","GRTS.Rank")

plot(r.LUCMon)

#### provide Lambert72 coord list
LB72X<-c(137525)
LB72Y<-c(195925)



#### function givePLOTID
getplotid<-function(LB72X,LB72Y) {
coordlist<-cbind(LB72X,LB72Y)  
### Determine cell in raster for x,y
PLOTNRS<-cellFromXY(r.LUCMon,coordlist)
### Determine PLOTIDs for these cells
PLOTID<-paste0("P",as.character(as.hexmode(PLOTNRS)))
return(PLOTID)
}


## checking
getplotid(137525,195925)
points(137525,195925,cex=1,pch=16)
getplotid(69085,187275)  #=> OK
getplotid(185735,229175) #=> OK

