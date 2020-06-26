# ----------------------------------------------------------------------------------------------------------------------------
# File path             : D:/Projects/Functions-for-studies-in-R
# Date created          : 201907
# Date for last modified: 20200623
# Programmer            :     FM
# To do before this step: (1) Install the dependent packages 
# Purpose               : (1) List the commonly used packages in the Pharmacy's studies
# ----------------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------------
# Sys.Date()  History
# ----------------------------------------------------------------------------------------------------------------------------
# 20200623       The old code is included. New functions,checking the library, is added into that.
# 20200626       Add new packages, pbapply, which can provide progressive bar for apply family.




# ----------------------------------------------------------------------------------------------------------------------------
# Checking the packages dependency
# ----------------------------------------------------------------------------------------------------------------------------

packages.I.commonly.used <- c("lubridate","readxl",'reshape2','tidyverse','pbapply')


check_and_install_packages <- function(package.name){
    if(!package.name %in% (.packages())){
        test <- require(package.name,quietly = T,character.only = T)
        if(test){
            print(paste0(package.name," is loaded correctly"))
        }else{
            print(paste0("trying to install ",package.name))
            install.packages(cat(package.name),quiet = T)
            require(package.name)
            if(test){
                print(paste0(package.name," is installed and loaded"))
            } else {
                stop(paste0("could not install",package.name,'. Pls check mannully.'))
            }
        }        
    }else{
        print(paste0(package.name,' already loaded'))
    }
}
unlist(lapply(packages.I.commonly.used,check_and_install_packages))


# ----------------------------------------------------------------------------------------------------------------------------
# Previous codes
# ----------------------------------------------------------------------------------------------------------------------------

# prepare_packages_for_analysis <- function(packages.I.commonly.used){
#     bollean_Packages_not_installed <- packages.I.commonly.used %in% as.vector(installed.packages()[,1])
#     packages_not_installed <- packages.I.commonly.used[bollean_Packages_not_installed]
#     
# }
# 
# library("lubridate")
# library("readxl")
# library("dplyr")
# library('reshape2')
# library("ggplot2")
# library('tidyverse')
