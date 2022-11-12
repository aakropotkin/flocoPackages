{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/file-uri-to-path?_rev=8-0ed43bb9061b24d600b8fc5d60ada622";
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
    ident = "file-uri-to-path";
    ldir  = "info/unscoped/f/file-uri-to-path";
    inherit packument fetchInfo;
  } // latest';

}
