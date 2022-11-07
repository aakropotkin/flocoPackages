{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-private-property-in-object?rev=16-aa7f5446082033ffeb70870f94bbc15c";
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
    scope = "@babel";
    ident = "@babel/plugin-proposal-private-property-in-object";
    ldir  = "info/babel/plugin-proposal-private-property-in-object";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
