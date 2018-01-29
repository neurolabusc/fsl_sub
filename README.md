# FSL_SUB

##### About

FSL is a popular tool for brain imaging. If you set it up on your laptop or desktop, many of the commands will take a long time to complete as they are run on a single CPU at a time. Big data centers typically set up a [Grid Engine](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslSge) to run FSL tasks in parallel, but this is complicated and not possible on all operating systems (e.g. macOS). By simply installing this tiny file, FSL will run on parallel on any desktop or laptop. Specifically, any task that would have used SGE if it was available will be spawned to all your available CPUs. This solution is described in more detail on my [optimizing FSL web page](http://www.mccauslandcenter.sc.edu/crnl/optimizing-spmfsl).

##### Recent Versions

29-Jan-2017
 - Example dataset included.

7-May-2017
 - [Explicitly use BASH shell](https://github.com/neurolabusc/fsl_sub/issues/1), which is not default for Debian. Note: if you use FSL it is probably a good idea to set BASH as your default shell, as several FSL scripts will fail with other shells (e.g. DASH).

30-August-2016
 - do not run "GPU" code in parallel

15-May-2015
 - Not all versions of sh support "declare"

3-March-2015
 - Initial version

##### Installation and Compiling

Replace your previous version of fsl_sub with this code. Tasks will automatically run in parallel. SGE will take precedence over this code, so if you ever upgrade to a SGE cluster you do not have to modify this function

```
cd $FSLDIR/bin
cp fsl_sub fsl_sub_orig
sudo cp ~/Downloads/fsl_sub/fsl_sub fsl_sub
sudo chmod +x fsl_sub
```

##### Installation

Replace the copy of `fsl_sub` that came with FSL with the version included here. To find the location of the original fsl_sub type `which fsl_sub` from the command line. You will want to make sure that the version of fsl_sub is executable (sudo chmod +x fsl_sub).

##### Tuning

After installation the code will automatically accelerate parallel processes. However, you can also control its behavior:

1. If you want to test the benefit, you can temporarily disable the function by using the command “FSLPARALLEL=0; export FSLPARALLEL”
2. If you want to test the benefit, you can temporarily force it to use precisely 8 cores with the command “FSLPARALLEL=8; export FSLPARALLEL”
3. If you want to test the benefit, you can temporarily force it to automatically detect the number of cores (the default behavior) with the command “FSLPARALLEL=1; export FSLPARALLEL”
4. To make permanent changes, add the desired FSLPARALLEL setting to your profile.

##### Testing

If you want to test the effectiveness of parallel processing on your computer, un-compress the folder "bedpostTest.zip" and run the shell script "runme_quick.sh" - this will [FSL's Bedpost](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FDT/UserGuide) twice: once with parallel processing off and once with it on.

##### License

This software uses the FMRIB Software Library license, which is embedded in the source code.