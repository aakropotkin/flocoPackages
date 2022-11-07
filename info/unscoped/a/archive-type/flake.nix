{

  inputs.packument.url   = "https://registry.npmjs.org/archive-type?rev=32-59fbfe8bea8db777c8edba49aa6b8f1a";
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
    ident = "archive-type";
    ldir  = "info/unscoped/a/archive-type";
    inherit packument fetchInfo;
  } // latest';

}
