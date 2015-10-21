```
summary(tidy.data)
    Subject                  Activity  Time.Body.Acceleration.Mean.X Time.Body.Acceleration.Mean.Y
 1      :  6   WALKING           :30   Min.   :0.2216                Min.   :-0.040514            
 2      :  6   WALKING_UPSTAIRS  :30   1st Qu.:0.2712                1st Qu.:-0.020022            
 3      :  6   WALKING_DOWNSTAIRS:30   Median :0.2770                Median :-0.017262            
 4      :  6   SITTING           :30   Mean   :0.2743                Mean   :-0.017876            
 5      :  6   STANDING          :30   3rd Qu.:0.2800                3rd Qu.:-0.014936            
 6      :  6   LAYING            :30   Max.   :0.3015                Max.   :-0.001308            
 (Other):144                                                                                      
 Time.Body.Acceleration.Mean.Z Time.Body.Acceleration.StDev.X Time.Body.Acceleration.StDev.Y
 Min.   :-0.15251              Min.   :-0.9961                Min.   :-0.99024              
 1st Qu.:-0.11207              1st Qu.:-0.9799                1st Qu.:-0.94205              
 Median :-0.10819              Median :-0.7526                Median :-0.50897              
 Mean   :-0.10916              Mean   :-0.5577                Mean   :-0.46046              
 3rd Qu.:-0.10443              3rd Qu.:-0.1984                3rd Qu.:-0.03077              
 Max.   :-0.07538              Max.   : 0.6269                Max.   : 0.61694              
                                                                                            
 Time.Body.Acceleration.StDev.Z Time.Gravity.Acceleration.Mean.X Time.Gravity.Acceleration.Mean.Y
 Min.   :-0.9877                Min.   :-0.6800                  Min.   :-0.47989                
 1st Qu.:-0.9498                1st Qu.: 0.8376                  1st Qu.:-0.23319                
 Median :-0.6518                Median : 0.9208                  Median :-0.12782                
 Mean   :-0.5756                Mean   : 0.6975                  Mean   :-0.01621                
 3rd Qu.:-0.2306                3rd Qu.: 0.9425                  3rd Qu.: 0.08773                
 Max.   : 0.6090                Max.   : 0.9745                  Max.   : 0.95659                
                                                                                                 
 Time.Gravity.Acceleration.Mean.Z Time.Gravity.Acceleration.StDev.X Time.Gravity.Acceleration.StDev.Y
 Min.   :-0.49509                 Min.   :-0.9968                   Min.   :-0.9942                  
 1st Qu.:-0.11726                 1st Qu.:-0.9825                   1st Qu.:-0.9711                  
 Median : 0.02384                 Median :-0.9695                   Median :-0.9590                  
 Mean   : 0.07413                 Mean   :-0.9638                   Mean   :-0.9524                  
 3rd Qu.: 0.14946                 3rd Qu.:-0.9509                   3rd Qu.:-0.9370                  
 Max.   : 0.95787                 Max.   :-0.8296                   Max.   :-0.6436                  
                                                                                                     
 Time.Gravity.Acceleration.StDev.Z Time.Body.AccelerationJerk.Mean.X Time.Body.AccelerationJerk.Mean.Y
 Min.   :-0.9910                   Min.   :0.04269                   Min.   :-0.0386872               
 1st Qu.:-0.9605                   1st Qu.:0.07396                   1st Qu.: 0.0004664               
 Median :-0.9450                   Median :0.07640                   Median : 0.0094698               
 Mean   :-0.9364                   Mean   :0.07947                   Mean   : 0.0075652               
 3rd Qu.:-0.9180                   3rd Qu.:0.08330                   3rd Qu.: 0.0134008               
 Max.   :-0.6102                   Max.   :0.13019                   Max.   : 0.0568186               
                                                                                                      
 Time.Body.AccelerationJerk.Mean.Z Time.Body.AccelerationJerk.StDev.X Time.Body.AccelerationJerk.StDev.Y
 Min.   :-0.067458                 Min.   :-0.9946                    Min.   :-0.9895                   
 1st Qu.:-0.010601                 1st Qu.:-0.9832                    1st Qu.:-0.9724                   
 Median :-0.003861                 Median :-0.8104                    Median :-0.7756                   
 Mean   :-0.004953                 Mean   :-0.5949                    Mean   :-0.5654                   
 3rd Qu.: 0.001958                 3rd Qu.:-0.2233                    3rd Qu.:-0.1483                   
 Max.   : 0.038053                 Max.   : 0.5443                    Max.   : 0.3553                   
                                                                                                        
 Time.Body.AccelerationJerk.StDev.Z Time.Body.AngularVelocity.Mean.X Time.Body.AngularVelocity.Mean.Y
 Min.   :-0.99329                   Min.   :-0.20578                 Min.   :-0.20421                
 1st Qu.:-0.98266                   1st Qu.:-0.04712                 1st Qu.:-0.08955                
 Median :-0.88366                   Median :-0.02871                 Median :-0.07318                
 Mean   :-0.73596                   Mean   :-0.03244                 Mean   :-0.07426                
 3rd Qu.:-0.51212                   3rd Qu.:-0.01676                 3rd Qu.:-0.06113                
 Max.   : 0.03102                   Max.   : 0.19270                 Max.   : 0.02747                
                                                                                                     
 Time.Body.AngularVelocity.Mean.Z Time.Body.AngularVelocity.StDev.X Time.Body.AngularVelocity.StDev.Y
 Min.   :-0.07245                 Min.   :-0.9943                   Min.   :-0.9942                  
 1st Qu.: 0.07475                 1st Qu.:-0.9735                   1st Qu.:-0.9629                  
 Median : 0.08512                 Median :-0.7890                   Median :-0.8017                  
 Mean   : 0.08744                 Mean   :-0.6916                   Mean   :-0.6533                  
 3rd Qu.: 0.10177                 3rd Qu.:-0.4414                   3rd Qu.:-0.4196                  
 Max.   : 0.17910                 Max.   : 0.2677                   Max.   : 0.4765                  
                                                                                                     
 Time.Body.AngularVelocity.StDev.Z Time.Body.AngularVelocityJerk.Mean.X
 Min.   :-0.9855                   Min.   :-0.15721                    
 1st Qu.:-0.9609                   1st Qu.:-0.10322                    
 Median :-0.8010                   Median :-0.09868                    
 Mean   :-0.6164                   Mean   :-0.09606                    
 3rd Qu.:-0.3106                   3rd Qu.:-0.09110                    
 Max.   : 0.5649                   Max.   :-0.02209                    
                                                                       
 Time.Body.AngularVelocityJerk.Mean.Y Time.Body.AngularVelocityJerk.Mean.Z
 Min.   :-0.07681                     Min.   :-0.092500                   
 1st Qu.:-0.04552                     1st Qu.:-0.061725                   
 Median :-0.04112                     Median :-0.053430                   
 Mean   :-0.04269                     Mean   :-0.054802                   
 3rd Qu.:-0.03842                     3rd Qu.:-0.048985                   
 Max.   :-0.01320                     Max.   :-0.006941                   
                                                                          
 Time.Body.AngularVelocityJerk.StDev.X Time.Body.AngularVelocityJerk.StDev.Y
 Min.   :-0.9965                       Min.   :-0.9971                      
 1st Qu.:-0.9800                       1st Qu.:-0.9832                      
 Median :-0.8396                       Median :-0.8942                      
 Mean   :-0.7036                       Mean   :-0.7636                      
 3rd Qu.:-0.4629                       3rd Qu.:-0.5861                      
 Max.   : 0.1791                       Max.   : 0.2959                      
                                                                            
 Time.Body.AngularVelocityJerk.StDev.Z Time.Body.Acceleration.Magnitude.Mean
 Min.   :-0.9954                       Min.   :-0.9865                      
 1st Qu.:-0.9848                       1st Qu.:-0.9573                      
 Median :-0.8610                       Median :-0.4829                      
 Mean   :-0.7096                       Mean   :-0.4973                      
 3rd Qu.:-0.4741                       3rd Qu.:-0.0919                      
 Max.   : 0.1932                       Max.   : 0.6446                      
                                                                            
 Time.Body.Acceleration.Magnitude.StDev Time.Gravity.Acceleration.Magnitude.Mean
 Min.   :-0.9865                        Min.   :-0.9865                         
 1st Qu.:-0.9430                        1st Qu.:-0.9573                         
 Median :-0.6074                        Median :-0.4829                         
 Mean   :-0.5439                        Mean   :-0.4973                         
 3rd Qu.:-0.2090                        3rd Qu.:-0.0919                         
 Max.   : 0.4284                        Max.   : 0.6446                         
                                                                                
 Time.Gravity.Acceleration.Magnitude.StDev Time.Body.AccelerationJerk.Magnitude.Mean
 Min.   :-0.9865                           Min.   :-0.9928                          
 1st Qu.:-0.9430                           1st Qu.:-0.9807                          
 Median :-0.6074                           Median :-0.8168                          
 Mean   :-0.5439                           Mean   :-0.6079                          
 3rd Qu.:-0.2090                           3rd Qu.:-0.2456                          
 Max.   : 0.4284                           Max.   : 0.4345                          
                                                                                    
 Time.Body.AccelerationJerk.Magnitude.StDev Time.Body.AngularVelocity.Magnitude.Mean
 Min.   :-0.9946                            Min.   :-0.9807                         
 1st Qu.:-0.9765                            1st Qu.:-0.9461                         
 Median :-0.8014                            Median :-0.6551                         
 Mean   :-0.5842                            Mean   :-0.5652                         
 3rd Qu.:-0.2173                            3rd Qu.:-0.2159                         
 Max.   : 0.4506                            Max.   : 0.4180                         
                                                                                    
 Time.Body.AngularVelocity.Magnitude.StDev Time.Body.AngularVelocityJerk.Magnitude.Mean
 Min.   :-0.9814                           Min.   :-0.99732                            
 1st Qu.:-0.9476                           1st Qu.:-0.98515                            
 Median :-0.7420                           Median :-0.86479                            
 Mean   :-0.6304                           Mean   :-0.73637                            
 3rd Qu.:-0.3602                           3rd Qu.:-0.51186                            
 Max.   : 0.3000                           Max.   : 0.08758                            
                                                                                       
 Time.Body.AngularVelocityJerk.Magnitude.StDev Freq.Body.Acceleration.Mean.X Freq.Body.Acceleration.Mean.Y
 Min.   :-0.9977                               Min.   :-0.9952               Min.   :-0.98903             
 1st Qu.:-0.9805                               1st Qu.:-0.9787               1st Qu.:-0.95361             
 Median :-0.8809                               Median :-0.7691               Median :-0.59498             
 Mean   :-0.7550                               Mean   :-0.5758               Mean   :-0.48873             
 3rd Qu.:-0.5767                               3rd Qu.:-0.2174               3rd Qu.:-0.06341             
 Max.   : 0.2502                               Max.   : 0.5370               Max.   : 0.52419             
                                                                                                          
 Freq.Body.Acceleration.Mean.Z Freq.Body.Acceleration.StDev.X Freq.Body.Acceleration.StDev.Y
 Min.   :-0.9895               Min.   :-0.9966                Min.   :-0.99068              
 1st Qu.:-0.9619               1st Qu.:-0.9820                1st Qu.:-0.94042              
 Median :-0.7236               Median :-0.7470                Median :-0.51338              
 Mean   :-0.6297               Mean   :-0.5522                Mean   :-0.48148              
 3rd Qu.:-0.3183               3rd Qu.:-0.1966                3rd Qu.:-0.07913              
 Max.   : 0.2807               Max.   : 0.6585                Max.   : 0.56019              
                                                                                            
 Freq.Body.Acceleration.StDev.Z Freq.Body.AccelerationJerk.Mean.X Freq.Body.AccelerationJerk.Mean.Y
 Min.   :-0.9872                Min.   :-0.9946                   Min.   :-0.9894                  
 1st Qu.:-0.9459                1st Qu.:-0.9828                   1st Qu.:-0.9725                  
 Median :-0.6441                Median :-0.8126                   Median :-0.7817                  
 Mean   :-0.5824                Mean   :-0.6139                   Mean   :-0.5882                  
 3rd Qu.:-0.2655                3rd Qu.:-0.2820                   3rd Qu.:-0.1963                  
 Max.   : 0.6871                Max.   : 0.4743                   Max.   : 0.2767                  
                                                                                                   
 Freq.Body.AccelerationJerk.Mean.Z Freq.Body.AccelerationJerk.StDev.X Freq.Body.AccelerationJerk.StDev.Y
 Min.   :-0.9920                   Min.   :-0.9951                    Min.   :-0.9905                   
 1st Qu.:-0.9796                   1st Qu.:-0.9847                    1st Qu.:-0.9737                   
 Median :-0.8707                   Median :-0.8254                    Median :-0.7852                   
 Mean   :-0.7144                   Mean   :-0.6121                    Mean   :-0.5707                   
 3rd Qu.:-0.4697                   3rd Qu.:-0.2475                    3rd Qu.:-0.1685                   
 Max.   : 0.1578                   Max.   : 0.4768                    Max.   : 0.3498                   
                                                                                                        
 Freq.Body.AccelerationJerk.StDev.Z Freq.Body.AngularVelocity.Mean.X Freq.Body.AngularVelocity.Mean.Y
 Min.   :-0.993108                  Min.   :-0.9931                  Min.   :-0.9940                 
 1st Qu.:-0.983747                  1st Qu.:-0.9697                  1st Qu.:-0.9700                 
 Median :-0.895121                  Median :-0.7300                  Median :-0.8141                 
 Mean   :-0.756489                  Mean   :-0.6367                  Mean   :-0.6767                 
 3rd Qu.:-0.543787                  3rd Qu.:-0.3387                  3rd Qu.:-0.4458                 
 Max.   :-0.006236                  Max.   : 0.4750                  Max.   : 0.3288                 
                                                                                                     
 Freq.Body.AngularVelocity.Mean.Z Freq.Body.AngularVelocity.StDev.X Freq.Body.AngularVelocity.StDev.Y
 Min.   :-0.9860                  Min.   :-0.9947                   Min.   :-0.9944                  
 1st Qu.:-0.9624                  1st Qu.:-0.9750                   1st Qu.:-0.9602                  
 Median :-0.7909                  Median :-0.8086                   Median :-0.7964                  
 Mean   :-0.6044                  Mean   :-0.7110                   Mean   :-0.6454                  
 3rd Qu.:-0.2635                  3rd Qu.:-0.4813                   3rd Qu.:-0.4154                  
 Max.   : 0.4924                  Max.   : 0.1966                   Max.   : 0.6462                  
                                                                                                     
 Freq.Body.AngularVelocity.StDev.Z Freq.Body.Acceleration.Magnitude.Mean
 Min.   :-0.9867                   Min.   :-0.9868                      
 1st Qu.:-0.9643                   1st Qu.:-0.9560                      
 Median :-0.8224                   Median :-0.6703                      
 Mean   :-0.6577                   Mean   :-0.5365                      
 3rd Qu.:-0.3916                   3rd Qu.:-0.1622                      
 Max.   : 0.5225                   Max.   : 0.5866                      
                                                                        
 Freq.Body.Acceleration.Magnitude.StDev Freq.Body.AccelerationJerk.Magnitude.Mean
 Min.   :-0.9876                        Min.   :-0.9940                          
 1st Qu.:-0.9452                        1st Qu.:-0.9770                          
 Median :-0.6513                        Median :-0.7940                          
 Mean   :-0.6210                        Mean   :-0.5756                          
 3rd Qu.:-0.3654                        3rd Qu.:-0.1872                          
 Max.   : 0.1787                        Max.   : 0.5384                          
                                                                                 
 Freq.Body.AccelerationJerk.Magnitude.StDev Freq.Body.AngularVelocity.Magnitude.Mean
 Min.   :-0.9944                            Min.   :-0.9865                         
 1st Qu.:-0.9752                            1st Qu.:-0.9616                         
 Median :-0.8126                            Median :-0.7657                         
 Mean   :-0.5992                            Mean   :-0.6671                         
 3rd Qu.:-0.2668                            3rd Qu.:-0.4087                         
 Max.   : 0.3163                            Max.   : 0.2040                         
                                                                                    
 Freq.Body.AngularVelocity.Magnitude.StDev Freq.Body.AngularVelocityJerk.Magnitude.Mean
 Min.   :-0.9815                           Min.   :-0.9976                             
 1st Qu.:-0.9488                           1st Qu.:-0.9813                             
 Median :-0.7727                           Median :-0.8779                             
 Mean   :-0.6723                           Mean   :-0.7564                             
 3rd Qu.:-0.4277                           3rd Qu.:-0.5831                             
 Max.   : 0.2367                           Max.   : 0.1466                             
                                                                                       
 Freq.Body.AngularVelocityJerk.Magnitude.StDev
 Min.   :-0.9976                              
 1st Qu.:-0.9802                              
 Median :-0.8941                              
 Mean   :-0.7715                              
 3rd Qu.:-0.6081                              
 Max.   : 0.2878
 ```