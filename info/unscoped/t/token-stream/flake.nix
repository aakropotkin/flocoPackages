{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/token-stream?_rev=10-af38fd471ce165ec908dc6243f0a23d6";
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
    ident = "token-stream";
    ldir  = "info/unscoped/t/token-stream";
    inherit packument fetchInfo;
  } // latest';

}
