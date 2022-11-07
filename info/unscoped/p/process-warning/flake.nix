{

  inputs.packument.url   = "https://registry.npmjs.org/process-warning?rev=2-c48b2431f6d6a3cf0b044d5dc92caea3";
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
    ident = "process-warning";
    ldir  = "info/unscoped/p/process-warning";
    inherit packument fetchInfo;
  } // latest';

}
