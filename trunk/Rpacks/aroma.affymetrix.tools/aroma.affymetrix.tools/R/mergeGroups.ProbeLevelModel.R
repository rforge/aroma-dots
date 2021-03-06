setMethodS3("mergeGroups","ProbeLevelModel",function(this,units,arrays=NULL,fields=NULL,force=FALSE,logscale=FALSE,...){
    unitFcn<-getUnitMergeGroupsFunction(this,logscale=logscale,...) #a function that takes a groupList, arrays, and fields
    data<-readUnits(this,units=units,force=force)
    if(is.null(arrays)) arrays<-1:nbrOfArrays(getDataSet(this))
    if(!is.null(fields)) mergeData<-lapply(data,unitFcn,fields=fields,arrays=arrays)
    else mergeData<-lapply(data,unitFcn,arrays=arrays)
    return(mergeData)
})
