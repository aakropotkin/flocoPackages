{

  inputs.packument.url   = "https://registry.npmjs.org/find-root?rev=23-8576e85f2b0dbcb015f52a55315d1dc2";
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
    ident = "find-root";
    ldir  = "info/unscoped/f/find-root";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
