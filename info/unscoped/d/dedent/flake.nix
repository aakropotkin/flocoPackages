{

  inputs.packument.url   = "https://registry.npmjs.org/dedent?rev=31-21b62a00af72fc7a04a04ff0818a5c2c";
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
    ident = "dedent";
    ldir  = "info/unscoped/d/dedent";
    inherit packument fetchInfo;
  } // latest';

}
