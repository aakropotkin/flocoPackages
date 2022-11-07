{

  inputs.packument.url   = "https://registry.npmjs.org/esrecurse?rev=28-1fe31e3e36177600a16b394f67305c12";
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
    ident = "esrecurse";
    ldir  = "info/unscoped/e/esrecurse";
    inherit packument fetchInfo;
  } // latest';

}
