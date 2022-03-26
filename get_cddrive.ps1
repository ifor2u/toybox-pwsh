$report = @()

foreach($vm in get-vm) {
    foreach ($cd in $(get-cddrive -vm $vm)) {
        $row=""|select vm,name,state
        $row.vm = $vm.name
        $row.name = $cd.name
        $row.state=$cd.connectionstate
        $report += $row
    }
}

$report|select
