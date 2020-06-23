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


# ----------------------------------------------------------------------------------------------------------------------------
# Mannul function ----
# ----------------------------------------------------------------------------------------------------------------------------


# ----------------------------------------------------------------------------------------------------------------------------
#   validate the name of columns 
# ----------------------------------------------------------------------------------------------------------------------------
my_custom_name_repair <- function(x) tolower(gsub("\\.{1,}",'\\.',gsub("\n|  ", "", make.names(x))))



check_consistancy_columns <- function(directory){
    list.df<- lapply(list.files(path=directory,full.names = T),readxl::read_xlsx,.name_repair=my_custom_name_repair,n_max=1)
    return(lapply(list.df,colnames))
}


merge_files <- function(files,numberofrows=Inf){
    list_df <- lapply(files,readxl::read_xlsx,.name_repair=my_custom_name_repair,n_max=numberofrows) 
    df <- list_df %>% bind_rows(.)
    print(files)
    return(df)
}


merge_files_xls <- function(files){
    list_df <- lapply(files,readxl::read_xls,.name_repair=my_custom_name_repair) 
    df <- list_df %>% bind_rows(.)
    return(df)
}
