{

  inputs.packument.url   = "https://registry.npmjs.org/package-json?rev=55-2c453914ec3c28325bd7a48f0ee3bbe0";
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
    ident = "package-json";
    ldir  = "info/unscoped/p/package-json";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
