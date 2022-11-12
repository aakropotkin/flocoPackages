{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pretty-bytes?_rev=71-d3b567091d5fa72edc6982dad1b5c248";
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
    ident = "pretty-bytes";
    ldir  = "info/unscoped/p/pretty-bytes";
    inherit packument fetchInfo;
  } // latest';

}
