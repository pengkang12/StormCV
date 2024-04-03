#!/bin/bash

# compile sourcecode
cd stormcv 
mvn install
cd ../stormcv-deploy
mvn install
cd ..

lib="$HOME/apache-storm-0.9.6/StormCV/stormcv-deploy/target/stormcv-deploy-0.0.1-SNAPSHOT-jar-with-dependencies.jar"

bin/storm jar $lib nl.tno.stormcv.deploy.E1_GrayScaledTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E2_FacedetectionTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E3_MultipleFeaturesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E4_SequentialFeaturesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E5_TilingTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E6_GroupOfFramesTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E7_FetchOperateCombiTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E8_BackgroundSubtractionTopology
bin/storm jar $lib nl.tno.stormcv.deploy.E9_ContrastEnhancementTopology
