{

  inputs.packument.url   = "https://registry.npmjs.org/connect?rev=955-78d2d4d31ba08498c92c18eaaa077fc9";
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
    ident = "connect";
    ldir  = "info/unscoped/c/connect";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
