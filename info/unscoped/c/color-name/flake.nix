{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/color-name?_rev=16-0b775155abb6444519e5f1c7655731ca";
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
    ident = "color-name";
    ldir  = "info/unscoped/c/color-name";
    inherit packument fetchInfo;
  } // latest';

}
