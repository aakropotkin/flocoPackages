{

  inputs.packument.url   = "https://registry.npmjs.org/ts-invariant?rev=40-335bd0132c5d5122184eb4cdd70e9b83";
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
    ident = "ts-invariant";
    ldir  = "info/unscoped/t/ts-invariant";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
