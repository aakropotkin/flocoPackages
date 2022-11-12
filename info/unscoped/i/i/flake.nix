{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/i?_rev=42-736fa6afd3bef2fd702fac566654c1d6";
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
    ident = "i";
    ldir  = "info/unscoped/i/i";
    inherit packument fetchInfo;
  } // latest';

}
