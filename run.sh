#!/bin/bash
#export XUGGLE_HOME=/home/jetson/xuggler    
#export PATH=$XUGGLE_HOME/bin:$PATH    
#export LD_LIBRARY_PATH=$XUGGLE_HOME/lib:$LD_LIBRARY_PATH
# compile sourcecode
cd StormCV/stormcv 
mvn clean install -U
cd ../stormcv-deploy
mvn clean install -U
cd ../../

lib="$HOME/storm/StormCV/stormcv-deploy/target/stormcv-deploy-0.0.1-SNAPSHOT-jar-with-dependencies.jar"

bin/storm jar $lib nl.tno.stormcv.deploy.DeploymentTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E1_GrayScaledTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E2_FacedetectionTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E3_MultipleFeaturesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E4_SequentialFeaturesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E5_TilingTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E6_GroupOfFramesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E7_FetchOperateCombiTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E8_BackgroundSubtractionTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E9_ContrastEnhancementTopology
