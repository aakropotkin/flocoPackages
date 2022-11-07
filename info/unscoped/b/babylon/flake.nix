{

  inputs.packument.url   = "https://registry.npmjs.org/babylon?rev=286-99b7162e5b0a3aba13c682b07e918f26";
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
    ident = "babylon";
    ldir  = "info/unscoped/b/babylon";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
