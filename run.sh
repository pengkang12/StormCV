#!/bin/bash
# you need to expose the XUGGLE_HOME and LD_LIBRARY_PATH before running apache storm
# otherwise, you need to copy the $XUGGLE_HOME/lib content into /usr/local/lib/
export XUGGLE_HOME=$HOME/xuggler    
export PATH=$XUGGLE_HOME/bin:$PATH    
export LD_LIBRARY_PATH=$XUGGLE_HOME/lib:$LD_LIBRARY_PATH

# compile sourcecode
cd StormCV/stormcv 
mvn clean install -U
cd ../stormcv-deploy
mvn clean install -U
cd ../../

lib="$HOME/storm/StormCV/stormcv-deploy/target/stormcv-deploy-0.0.1-SNAPSHOT-jar-with-dependencies.jar"

$HOME/storm/bin/storm jar $lib nl.tno.stormcv.deploy.DeploymentTopology
exit
bin/storm jar $lib nl.tno.stormcv.deploy.E1_GrayScaledTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E2_FacedetectionTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E3_MultipleFeaturesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E4_SequentialFeaturesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E5_TilingTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E6_GroupOfFramesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E7_FetchOperateCombiTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E8_BackgroundSubtractionTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E9_ContrastEnhancementTopology
