{

  inputs.packument.url   = "https://registry.npmjs.org/dash-ast?rev=3-339aefb7e3d65722150bbd33c36a8319";
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
    ident = "dash-ast";
    ldir  = "info/unscoped/d/dash-ast";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
