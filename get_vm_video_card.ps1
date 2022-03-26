$report = @()

foreach($vm in get-vm){
    $vm.extensiondata.config.hardware.device|where {$_.gettype().name -eq "VirtualMachineVideoCard"}|%{
        $row=""|select name,videoramsizeinkb,autodetect,enable3dsupport
        $row.name=$vm.name
        $row.videoramsizeinkb=$_.videoramsizeinkb
        $row.autodetect=$_.useautodetect
        $row.enable3dsupport=$_.enable3dsupport
        $report += $row
    }
}

$report|select
