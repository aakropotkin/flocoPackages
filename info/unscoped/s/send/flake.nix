{

  inputs.packument.url   = "https://registry.npmjs.org/send?rev=139-08d04a6254eb9936a797ec70ec965206";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "send";
    ldir  = "info/unscoped/s/send";
    inherit packument fetchInfo;
  } // latest';

}
