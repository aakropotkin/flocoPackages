{

  inputs.packument.url   = "https://registry.npmjs.org/write-stream?rev=17-22c02918abe42980ce15546b119bb116";
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
    ident = "write-stream";
    ldir  = "info/unscoped/w/write-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
