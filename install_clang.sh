#!/bin/bash

# clang-format
echo "clang-format install"
sudo tee -a ~/.clang-format << EOF
 BasedOnStyle : Google
 AccessModifierOffset: -4
 ColumnLimit: 100
 IndentWidth:     4
 BreakBeforeBraces : Custom
 BraceWrapping:
   AfterClass:      true
   AfterControlStatement: false
   AfterEnum:       true
   AfterFunction:   true
   AfterNamespace:  true
   AfterObjCDeclaration: false
   AfterStruct:     true
   BeforeCatch:     true
   BeforeElse:      true
   IndentBraces:    false
 AllowShortFunctionsOnASingleLine: None
 AlignAfterOpenBracket: true
EOF
echo "************************************"
echo ""

# rqt_image_view install
echo "rqt_image_view install"
sudo apt-get install ros-melodic-rqt-image-view
echo "************************************"
echo ""
