{

  inputs.packument.url   = "https://registry.npmjs.org/babel-core?rev=637-dd0b470ede94bb0b8d7eba9700295116";
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
    ident = "babel-core";
    ldir  = "info/unscoped/b/babel-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
