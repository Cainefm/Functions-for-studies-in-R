# ----------------------------------------------------------------------------------------------------------------------------
# File path             : D:/Projects/Functions-for-studies-in-R
# Date created          : 20200623
# Date for last modified: 20200623
# Programmer            :     FM
# To do before this step: (1) Install the dependent packages 
# Purpose               : (1) Checing the consistancy of the data from CDARS, since some of the layout from HA are different
#                         (2) Read those data and merged them.
#                         (3) Saved it seperately as Rdata format.
# ----------------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------------
# Sys.Date()  History
# ----------------------------------------------------------------------------------------------------------------------------
# 20200623    The old code will be used and new functions,checking the consistancy of the raw data, will tried to add into that.
# 20200626    Trying to appy trycatch, but i can't pass the argument to that so i dont know how to warn with the error file.

# ----------------------------------------------------------------------------------------------------------------------------
#   validate the name of columns 
# ----------------------------------------------------------------------------------------------------------------------------
# my_custom_name_repair <- function(x) tolower(gsub("\\.{1,}",'\\.',gsub("\n|  ", "", make.names(x))))
# Change into the function in janitor


# ----------------------------------------------------------------------------------------------------------------------------
#   Check consistancy of the datasets
# ----------------------------------------------------------------------------------------------------------------------------
check_consistancy_columns <- function(directory){
    list.df<- lapply(list.files(path=directory,full.names = T),readxl::read_xlsx,n_max=1)
    list.colnames <- lapply(list.df,colnames)
    if(length(unique(list.colnames))==1){
        return('All data have the same columns')
    }else{
        return(as.data.frame(table(unique(lapply(list.colnames,paste0,collapse=',')))) %>% rename(colnames=Var1))
    }
}


merge_files <- function(directory){
    tryCatch({
        check_consistancy_columns(directory)
        },
        error = function(err){
            message(paste("Something wrong with the raw data"))
            message(cond)
            return(NULL)
        }
    )
    files <- list.files(path=directory,full.names = T)
    list_df <-   pbapply::pblapply(files,readxl::read_xlsx)
    df <- list_df %>% bind_rows(.)
    colnames(df) <- janitor::make_clean_names(colnames(df))
    # print(files)
    return(df)
}
