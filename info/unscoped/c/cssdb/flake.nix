{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cssdb?_rev=44-f7e8d3200ce810cca103e687b0bf4c4f";
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
    ident = "cssdb";
    ldir  = "info/unscoped/c/cssdb";
    inherit packument fetchInfo;
  } // latest';

}
