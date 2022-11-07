{

  inputs.packument.url   = "https://registry.npmjs.org/is-svg?rev=38-3cc4e20cf99805ac9a3ba6633e4ba2d6";
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
    ident = "is-svg";
    ldir  = "info/unscoped/i/is-svg";
    inherit packument fetchInfo;
  } // latest';

}
