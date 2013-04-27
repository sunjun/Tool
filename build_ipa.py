#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import os

OBJECTIVE_C_FILE = "/Users/sunjun/Documents/workspace/iOS/MoboAppHanDu_copy/MoboApp/Class/Shop/InterfaceManager/InterfaceManager.m"
PROJDIR = "/Users/sunjun/Documents/workspace/iOS/MoboAppHanDu_copy/"
TARGET_NAME = "韩都衣舍"
TARGET_SDK = "iphoneos"
PROJECT_BUILDDIR = PROJDIR + "build/Release-iphoneos/"
SIGN_NAME = "iPhone\\ Distribution:\\ Shandong\\ Handuyishe\\ Electronic\\ Commerce\\ Co.,\\ Ltd."
EMBED = "/Users/sunjun/Desktop/handu_push_adhoc.mobileprovision"

def replace_line(file_name, line_num, text):
    lines = open(file_name, 'r').readlines()
    lines[line_num] = text
    out = open(file_name, 'w')
    out.writelines(lines)
    out.close()

def run_main(read_file):
    ipa_names = open(read_file, 'r').readlines()
    for ipa_name in ipa_names:
        replace_line(OBJECTIVE_C_FILE, 113, ipa_name.rstrip()+ '\\\n')
        os.chdir(PROJDIR)
        build_app_command = "xcodebuild -target " + TARGET_NAME + " -sdk " \
                            + TARGET_SDK + " -configuration Release"
        os.system(build_app_command)
        print "*************************"
        print "build app"+ ipa_name
        print "*************************"
        build_ipa_command = " ".join(
            ("/usr/bin/xcrun -sdk iphoneos PackageApplication -v",
            PROJECT_BUILDDIR + TARGET_NAME + ".app" + " -o",
            "/Users/sunjun/Desktop/ipa/"+ipa_name.rstrip()+".ipa",
            "--sign",
            SIGN_NAME,
            "--embed",
            EMBED)
        )
        print build_ipa_command
        print "************************"
        os.system(build_ipa_command)
        print "*************************"
        print build_ipa_command
        print "build ipa"+ ipa_name
        print "*************************"

                            
if __name__ == "__main__":
    run_main(sys.argv[1])
