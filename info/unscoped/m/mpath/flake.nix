{

  inputs.packument.url   = "https://registry.npmjs.org/mpath?rev=35-84c939257ddba2395618b48200b7d581";
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
    ident = "mpath";
    ldir  = "info/unscoped/m/mpath";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
