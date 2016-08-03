# ------------------------------------- #
# Runner					 			#
# ------------------------------------- #
#!/bin/bash
Rscript /usr/local/data/topicModel/shell/4_LDA_model.r &
MyPID=$!
echo $MyPID