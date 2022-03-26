$video = $vm.extensiondata.config.hardware.device|where {$_.gettype().name -eq "VirtualMachineVideoCard"}
$video|select videoramsizeinkb,numdisplays

$vmconfig = new-object vmware.vim.virtualmachineconfigspec
$deviceconfig = new-object vmware.vim.virtualdeviceconfigspec

$deviceconfig.device = $video
$deviceconfig.device.videoramsizeinkb = 8192
$deviceconfig.operation = "edit"
$vmconfig.devicechange+=$config

$vmview=$vm|get-view
$vmview.reconfigvm($vmconfig)
#$vm.extensiondata.reconfigvm($vmconfig)
