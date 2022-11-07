{

  inputs.packument.url   = "https://registry.npmjs.org/object-inspect?rev=52-428a7eae3159f0c8b368737339161cad";
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
    ident = "object-inspect";
    ldir  = "info/unscoped/o/object-inspect";
    inherit packument fetchInfo;
  } // latest';

}
