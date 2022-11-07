{

  inputs.packument.url   = "https://registry.npmjs.org/read-only-stream?rev=11-5b6a6f96b5eeac735c4f06a613879558";
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
    ident = "read-only-stream";
    ldir  = "info/unscoped/r/read-only-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
