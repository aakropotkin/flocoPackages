{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bail?_rev=13-397a4862d1bf96dd17f24c8653f04964";
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
    ident = "bail";
    ldir  = "info/unscoped/b/bail";
    inherit packument fetchInfo;
  } // latest';

}
