{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tar-stream?_rev=97-a4e7253ac88934f9dc1d3925c57d097a";
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
    ident = "tar-stream";
    ldir  = "info/unscoped/t/tar-stream";
    inherit packument fetchInfo;
  } // latest';

}
