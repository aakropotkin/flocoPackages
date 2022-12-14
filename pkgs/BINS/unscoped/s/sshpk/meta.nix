{ version }: {

  binInfo.binPairs = let
    extra = if 0 < ( builtins.compareVersions "1.7.2" version ) then {} else {
      sshpk-sign = "bin/sshpk-sign";
      sshpk-verify = "bin/sshpk-verify";
    };
  in { sshpk-conv = "bin/sshpk-conv"; } // extra;

}
