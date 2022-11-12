{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/module-error?_rev=4-b464bac9e0bcead5af8bba8188cc4f30";
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
    ident = "module-error";
    ldir  = "info/unscoped/m/module-error";
    inherit packument fetchInfo;
  } // latest';

}
