{

  inputs.packument.url   = "https://registry.npmjs.org/junk?rev=32-f000ecd3b518f58d5a4771c9261780c5";
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
    ident = "junk";
    ldir  = "info/unscoped/j/junk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
