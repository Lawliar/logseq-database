## confusion matrix
          +-----+----------+
          | BUG | Not a Bug|
 +--------+-----+----------+
 |Detected|     |          |
 |  as a  |  TP |    FP    |
 |  bug   |     |          |
 +--------+-----+----------+
 |Detected|     |          |
 |as not a|  FN |    TN    |
 |  bug   |     |          |
 +--------+-----+----------+

       FP              FN
FPR= -------     FNR=------
      FP+TN           FN+TP

       FP              FN
FDR= -------     FOR= -----
      FP+TP           FN+TN
