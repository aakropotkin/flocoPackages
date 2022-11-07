{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-lodash?rev=86-5a27bcd068e0b6a1a895e4d078c6278c";
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
    ident = "babel-plugin-lodash";
    ldir  = "info/unscoped/b/babel-plugin-lodash";
    inherit packument fetchInfo;
  } // latest';

}
