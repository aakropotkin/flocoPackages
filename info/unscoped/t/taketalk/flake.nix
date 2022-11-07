{

  inputs.packument.url   = "https://registry.npmjs.org/taketalk?rev=8-5316af990a4357a24e4d8036f4f89e10";
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
    ident = "taketalk";
    ldir  = "info/unscoped/t/taketalk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
