{

  inputs.packument.url   = "https://registry.npmjs.org/pretty-format?rev=277-2d6e52b3a435ba3cd0350c9b5d9fe638";
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
    ident = "pretty-format";
    ldir  = "info/unscoped/p/pretty-format";
    inherit packument fetchInfo;
  } // latest';

}
