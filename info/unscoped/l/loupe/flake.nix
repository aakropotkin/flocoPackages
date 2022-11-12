{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/loupe?_rev=32-2439df3ec37e36631349d8e52dda7bbe";
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
    ident = "loupe";
    ldir  = "info/unscoped/l/loupe";
    inherit packument fetchInfo;
  } // latest';

}
