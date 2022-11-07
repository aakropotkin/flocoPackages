{

  inputs.packument.url   = "https://registry.npmjs.org/shallow-clone?rev=13-eb8e3f31d6f67ad1e77d55ee13b8c371";
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
    ident = "shallow-clone";
    ldir  = "info/unscoped/s/shallow-clone";
    inherit packument fetchInfo;
  } // latest';

}
