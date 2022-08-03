library(ithir)
#reading and writing to this path
path <- 'C:\\Users\\siddh\\Desktop\\DES\\Multiple Split Files\\'

#file will be mps3A1.csv
ext = 'mps'

#end of the file will be .csv
ed = '.csv'


# 4 soil properties are considered for splines
list_var = list('3A1.csv', '5A2.csv', '2A1.csv', '7B1.csv','2Z3.csv', 
                '503.01a.csv', '503.05a.csv', '503.08a.csv', 'P3A_NR.csv')

use_soils = read.csv('C:\\Users\\siddh\\Desktop\\DES\\Use these soils for ML or Correlation Plots\\use_soils.csv')

# soil index start from 1, so please add 1 to each value in df_soils


rmse_values = c()


# should be run from 1-179. 

# 1:67, 69:84, 86:179
for (i in 86:179) {
  value = use_soils[i,]+1
  
  path2 <- paste('Soil', value, sep = ' ')
  path3 <- paste(path2, '\\', sep = '')
  
  mps_path = 'C:\\Users\\siddh\\Desktop\\DES\\Multiple Split Files\\MPS Files\\'
  
  final_path <- paste(path, path3, sep = '')
  
  all_files = list.files(path = final_path, pattern = NULL, all.files = FALSE,
                         full.names = FALSE, recursive = FALSE,
                         ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
  
  # Iterating over all the files
  
  for (j in 1:length(all_files)) {
    
    curr_property = all_files[j] 
    
    # If the property is there, generate the mass-preserving spline for it. 
    if (curr_property %in% list_var) {
      
      read_from_here = paste(final_path, curr_property, sep = '')
      file = read.csv(read_from_here)
      
      keep <- c('SoilProfile', 'UpperDepth', 'LowerDepth', 'float_values')
      store <- file[keep]
      
      # converting meters to cms. 
      store['UpperDepth'] = store['UpperDepth'] * 100
      store['LowerDepth'] = store['LowerDepth'] * 100
      
      
      eaFit <- ea_spline(store, var.name = "float_values", d = t(c(0, 5, 15, 30, 60, 90, 130, 150)),
                         lam = 0.1, vlow = 0, show.progress = FALSE,)
      
      temp <- eaFit[3]
      
      temp_rmse = temp$splineFitError$rmse
      
      if(temp_rmse != 0) {
        rmse_values = append(rmse_values, temp_rmse)
      }
      
      
      
      # If there is a single '#', remove the '#' from that line while running. 
      # If there are multiple '#'s, then do not change that line at all. 
      
      
      
      ######write <- paste('mps', curr_property, sep = '') #mps3A1.csv
      ######write1 <- paste(final_path, write, sep = '') # 'C:\\Users\\siddh\\Desktop\\DES\\Multiple Split Files\\Soil 5\\mps3A1.csv'

      
      
      
      #write_here <- paste(use_soils[i,],'mps', sep = '_')
      #write_here2 <- paste(write_here, curr_property, sep = '_')
      
      #fpath <- paste(mps_path, write_here2, sep = '')
      #write.csv(eaFit[4], fpath)
    }
    
    
  }
}
